From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 06 Dec 2012 11:34:48 +0100
Subject: [Buildroot] [PATCH] pkg-download.mk: Fix shallow clone
In-Reply-To: <CANxTyt74ytgBNHb8koKuVTjei5sQP2FpUrwawMuG17=fAK3bXw@mail.gmail.com>
References: <1354445767-15308-1-git-send-email-sho@relinux.de>	<8738zo7835.fsf@dell.be.48ers.dk>
 <CANxTyt74ytgBNHb8koKuVTjei5sQP2FpUrwawMuG17=fAK3bXw@mail.gmail.com>
Message-ID: <50C074C8.3070406@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 06.12.2012 03:14, schrieb Danomi Manchego:
> Hi all,
>
> I ran into a minor problem with the shallow clone changes.  The test
> for doing a git shallow clone uses a grep.  From pkg-download.mk
> <http://pkg-download.mk>:
>
>   ((test `git ls-remote  $($(PKG)_SITE) | cut -f 2- | grep
> $($(PKG)_DL_VERSION)` && \
>
> If the grep returns multiple matches, then the "test" will fail, and
> then go on to do a full clone. The failure prints out:
>
>    bash: test: too many arguments
>
> It's because the grep filter matches multiple items in the ls-remote
> output.  For example, if you try to get your kernel from
> "http://arago-project.org/git/projects/linux-davinci.git", specifying
> a version of "03.22.00.02", then you will get two matches:
>
>    $ git ls-remote
> http://arago-project.org/git/projects/linux-davinci.git | cut -f 2- |
> grep 03.22.00.02
>     refs/heads/03.22.00.02 <http://03.22.00.02>
>     refs/tags/DEV_DAVINCIPSP_03.22.00.02
>
> There are ways to massage the grep to do better (maybe use "grep -q",
> or grep for "/string$" instead of just "string"), but the ls-remote
> command seems to take a ref directly.  I.e.
>
>    $ git ls-remote
> http://arago-project.org/git/projects/linux-davinci.git 03.22.00.02 |
> cut -f 2-
>    refs/heads/03.22.00.02 <http://03.22.00.02>
>    $
>    $ git ls-remote
> http://arago-project.org/git/projects/linux-davinci.git
> DEV_DAVINCIPSP_03.22.00.02 | cut -f 2-
>    refs/tags/DEV_DAVINCIPSP_03.22.00.02
>    $
>    $ git ls-remote
> http://arago-project.org/git/projects/linux-davinci.git JUNK | cut -f 2-
>    $
>
> So I'm wondering why the recent changes in this area used grep at all,
> rather than asking ls-remote directly.  I.e.:
>
> ((test `git ls-remote $($(PKG)_SITE) $($(PKG)_DL_VERSION) | cut -f 2-`
> && \
Hello Danomi,

this is quite simple to answer: because I didn't find out this possibility.
>
> If there is feedback that the above is desirable, then I can send in
> the patch.
If you send a patch I am quite sure to be able to test it.

Kind regards

Stephan
>
> Danomi -
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121206/f6062f47/attachment.html>
