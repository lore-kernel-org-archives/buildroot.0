From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Mar 2017 17:50:03 +0100
Subject: [Buildroot] [PATCH 1/1] Fix permissions on /dev/pts/ptmx for
 PTY allocation with systemd
In-Reply-To: <35a6c994-5279-4823-8864-be52f6f925ef@cesnet.cz>
References: <35a6c994-5279-4823-8864-be52f6f925ef@cesnet.cz>
Message-ID: <f6e8c322-c9cd-16cc-921d-e1985c314420@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jan,

On 17-03-17 17:02, Jan Kundr?t wrote:
> (This is my first patch to buildroot, please feel free to pester me if you
> prefer a different coding style or if you have some commit message suggestions.)

 Thank you for your contribution! Here goes the flaming :-)

It's pretty much perfect. Only:

- Please don't send patches as attachments, rather send them in-line. This makes
it easier to insert review comments inline in the patch. Using git send-email is
the most appropriate approach.

- If you want to include "personal comments" (like the "This is my first patch"
bit), you can include them in the commit message, but below a line containing just
---
Anything below that line will not be included in the git history.

- The subject line should always start with the name of the "subsystem" (usually
package) affected. It should also be pretty short. So in this case, something like:

skeleton: fix permissions of /dev/pts/ptmx


> Without this patch, it is not possible to allocate PTYs when a generated rootfs
> image with a recent glibc and systemd is launched as a container  on an RHEL7
> system via machinectl/systemd-nspawn. The container boots, but `machinectl login
> mycontainer` fails. The culprit is /dev/pts/ptmx with 0000 perms.
> 
> On a typical system, there are two `ptmx` devices. One is provided by the devpts
> at /dev/pts/ptmx and it is typically not directly accessed from userspace. The
> other one which actually *is* opened by processes is /dev/ptmx. Kernel's
> documentation says these days that /dev/ptmx should be either a symlink, or a
> bind mount of the /dev/pts/ptmx from devpts.
> 
> When a container is launched via machinectl/machined/systemd-nspawn, the
> container manager prepares a root filesystem so that the container can live in
> an appropriate namespace (this is similar to what initramfs is doing on x86
> desktops). During these preparations, systemd-nspawn mounts a devpts instance
> using a correct ptmxmode=0666 within the container-to-be's /dev/pts, and it adds
> a compatibility symlink at /dev/ptmx. However, once systemd takes over as an
> init in the container, /lib/systemd/systemd-remount-fs applies mount options
> from /etc/fstab to all fileystems. Because the buildroot's template used to not
> include the ptmxmode=... option, a default value of 0000 was taking an effect
> which in turn led to not being able to allocate any pseudo-terminals.

 What a great, extensive description, thank you for that!


> The relevant kernel option was introduced upstream in commit 1f8f1e29 back in
> 2009. The oldest linux-headers referenced from buildroot's config is 3.0, and
> that version definitely has that commit. I believe that adding this mount option
> therefore does not constitute any backward incompatibility issues.

 Anyway, unknown mount options are just ignored so it wouldn't be a regression.

 It's possible that Peter or Thomas will fix up the subject line while
committing, but if you do resend, you can add my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
