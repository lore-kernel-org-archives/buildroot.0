From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Jun 2012 01:12:30 +0200
Subject: [Buildroot] [RFC/PATCH 2/4] ensure target fs is writable
In-Reply-To: <1340031743-29694-3-git-send-email-ntl@pobox.com>
References: <1340031743-29694-1-git-send-email-ntl@pobox.com>
 <1340031743-29694-3-git-send-email-ntl@pobox.com>
Message-ID: <4FE258DE.1030702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/18/12 17:02, Nathan Lynch wrote:
> If the source target skeleton is read-only, modifications to the
> output target (such as creating /etc/hostname and /etc/issue) fail.
>
> Signed-off-by: Nathan Lynch<ntl@pobox.com>
> ---
>   Makefile |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 9a9634d..38276cd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -378,6 +378,7 @@ endif
>   	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
>   		if [ -d "$(TARGET_SKELETON)" ]; then \
>   			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
> +			chmod -R u+w $(TARGET_DIR)/; \

  Maybe it's safer to do this only on directories, e.g. with
rsync -a --chmod=Du+w $(TARGET_SKELETON)/ $(TARGET_DIR)/
(untested)


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
