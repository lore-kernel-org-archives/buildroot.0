From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Jan 2020 23:07:36 +0100
Subject: [Buildroot] BR2_EXTERNAL and linux-ext-*.mk
In-Reply-To: <20200123214412.GZ32369@scaer>
References: <CAEyMn7a2qBj2efokN1Au3qek8yNsg_hdjBzntkiC8nCFZ5M=rg@mail.gmail.com>
 <20200123214412.GZ32369@scaer>
Message-ID: <5f9b9342-a3bc-a24e-932e-f11460f28886@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I had composed a longish mail with essentially the same contents, but Yann beat
me to it :-)

On 23/01/2020 22:44, Yann E. MORIN wrote:
> On 2020-01-23 22:08 +0100, Heiko Thiery spake thusly:
>> Hi All,
>>
>> I recently recognized that there is the support to have linux patches
>> located in the BR2_EXTERNAL/linux directory with
>> c26eafa96cabd597a5cce534133ee0ff996b800c.
>>
>> While using this feature I noticed that in there seems to go something
>> wrong. Once a file that matchs linux/linux-ext-*.mk is detected the
>> LINUX_PKGDIR is set to the BR2_EXTERNAL/linux path and for example the
>> "0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional" patch
>> fails because the path is no longer valid. Also the hash check for the
>> linux sources fails due to the same reason.
>>
>> Following 2 "make-linux-patch" tries, the first ends without error and
>> the second show the error:
>>
>>
>>
>> ---------- without BR2_EXTERNAL/linux/linux-ext-xxx.mk:
> [--SNIP--]
>> # make printvars VARS=LINUX_PKGDIR
>> LINUX_PKGDIR=linux/
>> --------------------
>>
>> ----------  with BR2_EXTERNAL/linux/linux-ext-xxx.mk:
> [--SNIP--]
>> # make printvars VARS=LINUX_PKGDIR
>> LINUX_PKGDIR=/home/hthiery/sources/test-linux/buildroot-external-linux-test/linux/
>> ----------
>>
>> Do I miss something here or is this a bug?
> 
> This is a bug, but not a simple one.
> 
> FOO_PKGDIR is set based on the last component of the $(MAKEFILES)
> variable. That variables contains the list of Makefiles that have been
> included, in the order they've been included, with the top-level
> Makefile first (left-most), and the last one last (right-most).

From the info page:

'MAKEFILE_LIST'
     Contains the name of each makefile that is parsed by 'make', in the
     order in which it was parsed.  The name is appended just before
     'make' begins to parse the makefile.  Thus, if the first thing a
     makefile does is examine the last word in this variable, it will be
     the name of the current makefile.  Once the current makefile has
     used 'include', however, the last word will be the just-included
     makefile.


> As long as we did support only in-tree linux extensions, all was OK,
> because we would only include Makefiles from the same directory as the
> main linux.mk one, so LINUX_PKGDIR was set to the directory of the last
> linux extension included, which was OK.
> 
> But now, we can include extensions from a br2-external tree, and that
> last assumption breaks down.
> 
> When we added that support, we only thought about the name of the
> package, which is set based on the latest component of the directory, so
> it had to be 'linux'. But we completely forgot about the _PKGDIR
> variable. The existing comment only spoke about the directory name, not
> the full path, because FOO_PKGCDIR was only introduced after linux
> extensions were.

 Ah, that explains it. I didn't understand how it could ever have worked.


> It turns out that we may have a way out: we do not really care about the
> order the extensions are included, since all they do is register post
> hooks. So, if we were to include the extensions from the br2-external
> trees, then the in-tree ones, we'd be back to the original situation.

 Nice one!

 I had thought of another workaround: replace $(LINUX_PKGDIR) with linux - we
know that that is the name of the directory. _PKGDIR is used for only two
things: to find the package patches (and linux has none), and to find the hash
file. So we'll still loose the hash file.


> This is still a bit flaky, because we may end up breaking this again in
> the future, but I don;t have a better solution (well, we could also have
> a dummy empty makefile fragment that we explicitly include just right
> before callign the pkg-generic infra, but that's still fragile).

 I do have a better solution: my big delayed evaluation change. If most of the
inner-generic-package evaluation is delayed until the end of makefile processing
and we just set a few key variables (including _PKGDIR), then we can move the
call to generic-package much earlier (i.e. before the linux-ext-* include).

 We can't do that now because linux-ext-* may add dependencies, and those have
to be set before "$$($(2)_TARGET_CONFIGURE):	| $$($(2)_FINAL_DEPENDENCIES)" is
evaluated.


 Regards,
 Arnout

> Care to test and properly send: http://code.bulix.org/4fcw7l-1104853?raw
> 
> Regards,
> Yann E. MORIN.
> 
