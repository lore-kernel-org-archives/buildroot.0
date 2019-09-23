From: yann.morin at orange.com <yann.morin@orange.com>
Date: Mon, 23 Sep 2019 10:38:47 +0200
Subject: [Buildroot] [PATCH] toolchain: generate check-headers program
 under $(BUILD_DIR)
In-Reply-To: <20190923010514.16269-1-unixmania@gmail.com>
References: <20190923010514.16269-1-unixmania@gmail.com>
Message-ID: <6515_1569227955_5D8884B3_6515_6_12_20190923083847.GB3174@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2019-09-22 22:05 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Some installations mount /tmp with the 'noexec' option, which prevents
> running the program generated there to check the kernel headers.

I'm rather surprised that check-headers is the nly thing broken in that
case... :-/

Alternatively, we should probably use our own TMPDIR instead, which
would fix all such problems:

    diff --git a/Makefile b/Makefile
    index 82c844620a..a006149898 100644
    --- a/Makefile
    +++ b/Makefile
    @@ -209,6 +209,11 @@ BASE_TARGET_DIR := $(BASE_DIR)/target
     HOST_DIR := $(BASE_DIR)/host
     GRAPHS_DIR := $(BASE_DIR)/graphs
     
    +export TMPDIR = $(BUILD_DIR)/.br-temp-or-whatever
    +export TMP_DIR = $(TMPDIR)
    +export TEMP_DIR = $(TMPDIR)
    +# And so on...
    +
     LEGAL_INFO_DIR = $(BASE_DIR)/legal-info
     REDIST_SOURCES_DIR_TARGET = $(LEGAL_INFO_DIR)/sources
     REDIST_SOURCES_DIR_HOST = $(LEGAL_INFO_DIR)/host-sources
    @@ -1016,7 +1021,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
     
     # staging and target directories do NOT list these as
     # dependencies anywhere else
    -$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
    +$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(TMPDIR):
        @mkdir -p $@
     
     # outputmakefile generates a Makefile in the output directory, if using a

Doing smething like that would solve the issue globally, rather than
having ad-hoc solutions everywhere this will be needed.

> Avoid the problem by generating the program under $(BUILD_DIR), passed
> as the first argument to check-kernel-headers.sh.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12241
[--SNIP--]
> diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
> index a8cca78b27..cbf71e0f23 100755
> --- a/support/scripts/check-kernel-headers.sh
> +++ b/support/scripts/check-kernel-headers.sh
> @@ -1,14 +1,17 @@
>  #!/bin/sh
>  
> -SYSROOT="${1}"
> +BUILDDIR="${1}"
> +SYSROOT="${2}"
>  # Make sure we have enough version components
> -HDR_VER="${2}.0.0"
> +HDR_VER="${3}.0.0"
>  
>  HDR_M="${HDR_VER%%.*}"
>  HDR_V="${HDR_VER#*.}"
>  HDR_m="${HDR_V%%.*}"
>  
> -EXEC="$(mktemp -t check-headers.XXXXXX)"
> +EXEC="$(mktemp -p "${BUILDDIR}" -t .check-headers.XXXXXX)"
> +
> +trap 'rm -f "${EXEC}"' EXIT

Two things:

1. A trap on EXIT is a bashism, while this script uses /bin/sh, which
is not guaranteed to be bash.

2. Why do you want to use a trap on EXIT? If there is a motivation to do
so, it does not seem to be related to this change anyway, so should be
done in its own patch.

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
