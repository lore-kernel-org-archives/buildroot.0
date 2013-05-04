From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 May 2013 22:58:20 +0200
Subject: [Buildroot] [PATCH v4 01/12] toolchain/gcc: Add host-{flex,
	bison} dependencies for GCC 4.2, 4.3, 4.4
In-Reply-To: <1367524293-32081-2-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Thu, 2 May 2013 21:51:22 +0200")
References: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
 <1367524293-32081-2-git-send-email-mjonker@synopsys.com>
Message-ID: <87wqreqx77.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

 Mischa> Note that gcc doesn't use the package infrastructure, and needs proper
 Mischa> $(HOST_MAKE_ENV) and $(TARGET_MAKE_ENV) to be able to find host-flex/
 Mischa> host-bison.

 Mischa> Original patch by Thomas Petazzoni.

 Mischa> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
 Mischa> ---
 Mischa>  toolchain/gcc/gcc-uclibc-4.x.mk |   32 ++++++++++++++++++++------------
 Mischa>  1 files changed, 20 insertions(+), 12 deletions(-)

 Mischa> diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
 Mischa> index fc11ad4..0a96211 100644
 Mischa> --- a/toolchain/gcc/gcc-uclibc-4.x.mk
 Mischa> +++ b/toolchain/gcc/gcc-uclibc-4.x.mk
 Mischa> @@ -170,6 +170,14 @@ endif
 Mischa>  GCC_HOST_PREREQ += host-mpc
 Mischa>  endif
 
 Mischa> +ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
 Mischa> +ifneq ($(findstring x4.3.,x$(GCC_VERSION)),x4.3.)
 Mischa> +ifneq ($(findstring x4.4.,x$(GCC_VERSION)),x4.4.)
 Mischa> +GCC_HOST_PREREQ = host-flex host-bison

Ehh, two things:

- This implements the opposite logic of what the commit message says
  (E.G. adds flex/bison if the version ISN'T 4.2/4.3/4.4)

- It overrides GCC_HOST_PREREQ instead of appending to it even though
  the line just above already appends something.

It isn't clear to me what the gcc version logic should be, and if it is
somehow related to ARC - I don't recall any autobuilder failures
regarding missing flex/bison.

-- 
Bye, Peter Korsgaard
