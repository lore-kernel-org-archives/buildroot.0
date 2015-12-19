From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Dec 2015 15:35:58 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/cal3d: new package
In-Reply-To: <20151219150027.72263718@free-electrons.com>
References: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
 <1446915053-13783-3-git-send-email-bernd.kuhls@t-online.de>
 <20151219150027.72263718@free-electrons.com>
Message-ID: <56756B4E.9080409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-12-15 15:00, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat,  7 Nov 2015 17:50:52 +0100, Bernd Kuhls wrote:
>> This package only provides a git submodule for the vsxu package.
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> I don't really like the interaction between this package and the vsxu
> package, but I don't really have a better proposal to be honest.
> 
> Yann, Peter, Arnout, do you have some suggestions on how to handle such
> git submodule cases?

 Good that Bernd put that reference to my mail of two years ago [1]. When I read
that again I first thought that I would retract my statements from back then,
but in fact it still makes sense.

 There are basically two ways that we can consider such packages.

 The first way is to say it is a bundled package, in other words we download and
extract the submodule as part of the master. We have a precendent for this:
perl-cross (though there it's a bit the other way round, the principle is the
same). I described this approach as the first option for [1].

 The second way is to say that it is a separate package and we basically
unbundle it. Since the package itself doesn't support that, we have to do some
hacks to make it work, just like any distro has to make hacks to unbundle stuff.

 The second way is hackish because:
- we're instantiating the submodule in a different way than the package expects
it (as a symlink rather as a subtree);
- we're referring to the source of one package from another package.

 This last bit, however, is something we do all the time with LINUX_DIR, so
maybe it's not that much of a hack after all.

 The second way tends to be a bit less verbose too, because we can use a lot of
infrastructure that just doesn't exist to support the sub-package approach. But
it's not as bad anymore as when I wrote [1], because now we can use
_EXTRA_DOWNLOADS at least, so we just need to add a post-extract hook. So the
difference is just 2-3 lines.

 I have a slight preference for the first approach, but I would be fine with the
second approach (which Bernd chose here) as well. Though I do have a few
comments on that, which I'll state in the patch itself.

 Regards,
 Arnout


[1] http://lists.busybox.net/pipermail/buildroot/2013-March/069971.html


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
