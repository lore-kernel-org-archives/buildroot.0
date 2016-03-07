From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Mar 2016 00:39:46 +0100
Subject: [Buildroot] [Bug 8771] make savedefconfig modifies sources
In-Reply-To: <bug-8771-163-YmX2Br27g5@https.bugs.busybox.net/>
References: <bug-8771-163@https.bugs.busybox.net/>
 <bug-8771-163-YmX2Br27g5@https.bugs.busybox.net/>
Message-ID: <56DE1142.6080201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Taking this discussion to the list]

On 03/07/16 21:23, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=8771
>
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:
>
>             What    |Removed                     |Added
> ----------------------------------------------------------------------------
>           Resolution|---                         |WORKSFORME
>               Status|NEW                         |RESOLVED
>
> --- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
> This is the expected behavior. I personally don't like it (since it deviates
> from how the Linux kernel handles defconfig, and also because it's look weird),
> but that's the way it's supposed to work in Buildroot.
>
> Basically, the defconfig is stored to the file pointed by BR2_DEFCONFIG. By
> default, this option is set to $(CONFIG_DIR)/defconfig, which would do what you
> want, i.e save the defconfig next to the .config file.
>
> However, when you run "make <foobar>_defconfig", we set BR2_DEFCONFIG to
> "configs/<foobar>_defconfig". The original intent is to make things
> "transparent": if you start from a defconfig, the assumption is that you want
> changes made to this configuration to be saved back to the same defconfig.

  I think we do agree that it is weird for the in-tree defconfigs. In the past, 
there was no way to distinguish between the upstream in-tree defconfigs, and the 
defconfigs that you add to your custom buildroot tree for internal use. But now 
we could say that you're supposed to use BR2_EXTERNAL, So we could reset 
BR2_DEFCONFIG for in-tree configs.

  Of course, at the moment we still point to the in-tree 
configs/<boardname>_defconfig in the manual, so that would have to change first...

  Regards,
  Arnout


>
> You can override this at any time by changing BR2_DEFCONFIG in
> menuconfig/xconfig/nconfig, or simply on the command line by passing
> BR2_DEFCONFIG="/some/place".
>
> As I said, I personally don't really like this behavior, and I got confused
> several times. The fact that the source tree is modified is indeed another
> drawback of this behavior. However, I didn't find this to be too problematic to
> really argue against the contributors who wanted this feature.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
