From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 01 Dec 2013 01:46:52 +0100
Subject: [Buildroot] [PATCHv4 5/5] manual: fix manual generation with
 BR2_EXTERNAL support
In-Reply-To: <1385751626-28967-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1385751626-28967-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385751626-28967-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <529A86FC.7090204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/11/13 20:00, Thomas Petazzoni wrote:
> From: Samuel Martin <s.martin49@gmail.com>
>
> Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   docs/manual/manual.mk         | 1 +
>   support/scripts/kconfiglib.py | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index aeafd10..570318f 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -1,6 +1,7 @@
>   manual-update-lists: manual-check-dependencies-lists
>   	$(Q)$(call MESSAGE,"Updating the manual lists...")
>   	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
> +		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \

  Maybe a comment should be added here, like:

# Packages included in BR2_EXTERNAL are not part of buildroot, so they
# should not be included in the manual.


  Regards,
  Arnout

>   		$(TOPDIR)/support/scripts/gen-manual-lists.py
>
>   # we can't use suitable-host-package here because that's not available in
> diff --git a/support/scripts/kconfiglib.py b/support/scripts/kconfiglib.py
> index 0704cc0..e40947c 100644
> --- a/support/scripts/kconfiglib.py
> +++ b/support/scripts/kconfiglib.py
> @@ -2074,7 +2074,7 @@ set_re   = re.compile(r"CONFIG_(\w+)=(.*)")
>   unset_re = re.compile(r"# CONFIG_(\w+) is not set")
>
>   # Regular expression for finding $-references to symbols in strings
> -sym_ref_re = re.compile(r"\$[A-Za-z_]+")
> +sym_ref_re = re.compile(r"\$[A-Za-z_][0-9A-Za-z_]*")
>
>   # Integers representing symbol types
>   UNKNOWN, BOOL, TRISTATE, STRING, HEX, INT = range(0, 6)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
