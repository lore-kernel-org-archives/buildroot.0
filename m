From: Michael Walle <michael@walle.cc>
Date: Thu, 20 Oct 2016 22:29:15 +0200
Subject: [Buildroot] cached downloads for scm branches
In-Reply-To: <20161020213841.75105d07@free-electrons.com>
References: <f006d88783fb1d99aaef2d6cab1dfc88@walle.cc>
 <20161020213841.75105d07@free-electrons.com>
Message-ID: <D2934D97-E0A4-4AE5-933C-49D38BFFB436@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi, 

thanks. yeah i thought so. Just to give you some background regarding my question. We have some kind of CI, actually it's rather a daily build. we build a root filesystem with some fixed packages, but also with multiple packages of our own and we want to track the tip of a branch for a build (because it is CI ;)). I don't think the src override method really suit the CI case. I guess one way could be that the CI defines the commit that should be build. Or simply delete the download. mhh ;) 

-michael

sorry for the tofu. i'm on my mobile. 


Am 20. Oktober 2016 21:38:41 MESZ, schrieb Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>Hello,
>
>On Thu, 20 Oct 2016 19:27:19 +0200, Michael Walle wrote:
>
>> If I have a package which downloads it's source from a SCM branch,
>the 
>> download will be cached in DL_DIR/<pkgname>-<branchname>.tar.gz. This
>
>> makes sense if the version is a tag or a (git) hash. But if used with
>
>> branches, the package will never be downloaded again until I remove
>it 
>> from the DL_DIR. This may be the intended behaviour, but as far as I
>can 
>> tell, I have no chance to change it.
>> 
>> Do I miss something? Does it make sense to add a new package variable
>to 
>> force a download?
>
>This behavior is intended and adding a new package variable to force a
>download is not what we want to do. Indeed, Buildroot aims at doing
>*reproducible* builds. If a package points to a branch, then you have
>no idea what you are building, this what you're building depends on the
>moment you start the build (as it decides when you will fetch, and
>therefore what you will fetch).
>
>*However*, we have a mechanism called <pkg>_OVERRIDE_SRCDIR, which
>allows you to tell Buildroot: "For this specific package, please skip
>the download/extract/patch steps, and instead take the source from
><this> local directory". Thanks to that, you can checkout/clone your
>project source code in <this> folder, and ask Buildroot to fetch it
>from there. This is what we recommend during active development on a
>given component.
>
>See
>http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf
>slides 261 and following for more details.
>
>Best regards,
>
>Thomas
>-- 
>Thomas Petazzoni, CTO, Free Electrons
>Embedded Linux and Kernel engineering
>http://free-electrons.com
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161020/41bb724b/attachment.html>
