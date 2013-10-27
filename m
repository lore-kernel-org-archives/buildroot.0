From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2013 12:35:19 +0100
Subject: [Buildroot] [PATCH] Fix compilation of systemd with uclibc
In-Reply-To: <1380627492-25380-1-git-send-email-jezz@sysmic.org>
References: <1380627492-25380-1-git-send-email-jezz@sysmic.org>
Message-ID: <526CFA77.6010609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/10/13 13:38, J?r?me Pouiller wrote:
> systemd-uclibc-fix.patch was applied to systemd to provide execvpe function
> when compiled with uclibc. However, this function is now provided by
> libc-add-non-standard-execvpe-function.patch in uclibc package.
>
> These two patchs are now in conflict. This commit remove
> systemd/systemd-uclibc-fix.patch.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

  Hi J?r?me, Eric,

  After a long discussion at the Buildroot developer meeting, we decided 
that there really is no good solution for this situation. So we decided 
that the best solution is to just remove uClibc support for systemd: 
upstream will never accept patches that fixes it in a proper way, and 
people who have the systemd bloat will probably not care about saving a 
few 100K by using uClibc.

  So, Eric, could you include in your systemd bump a

depends on !BR2_TOOLCHAIN_USES_UCLIBC

(with appropriate comment).

  We'll see if it succeeds with musl, but that's less important for the 
time being.


  Regards,
  Arnout

> ---
>   package/systemd/systemd-uclibc-fix.patch |   59 ------------------------------
>   1 file changed, 59 deletions(-)
>   delete mode 100644 package/systemd/systemd-uclibc-fix.patch
>
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
