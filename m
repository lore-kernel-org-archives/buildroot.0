From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 23 Apr 2014 16:06:18 +0200
Subject: [Buildroot] [PATCH v3] LT.old: Make
 __errno_location/__h_errno_location thread safe
In-Reply-To: <1397642272-13260-1-git-send-email-vgupta@synopsys.com>
References: <1397642272-13260-1-git-send-email-vgupta@synopsys.com>
Message-ID: <CAC1BbcQS4EKiT8mHXUH36Zbr7Nvb95WEjcHfdgWQ+J1dWbTv7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 April 2014 11:57, Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> WHY: errno in uClibc is not thread safe
>
> HOW: __errno_location and it's sibling __h_errno_location need to be called
>      via PLT - even from within libc. That way when linked with pthread,
>      intra-uClibc callers will also use the thread safe version.
>
>      This is achieved by removing the GI alias for these functions,
>      ensuring that they get called normally (via PLT)
>
> Verified with ARC LT.old and ARM cubieboard2 buildroot (LT.old)
> NPTL is unaffected by this bug.
>
> ------------ History behind this patch ---------------------
>
> This is a long standing bug (https://bugs.busybox.net/show_bug.cgi?id=2089)
>
> Others have tried to fix it in past (alteast Peter Korsgaard's patch in 2010),
> but somehow failed to be merged (or were backed out afterwards).
> http://lists.uclibc.org/pipermail/uclibc/2010-July/044176.html
>
> One of the causes could be side effect of atleast one more bug related to
> pthreads and static link which has now been fixed.
> http://lists.uclibc.org/pipermail/uclibc/2013-October/047958.html
>
> I have solved this w/o looking at other pacthes but would like to give
> credit to Peter and others for confirming that it makes sense.
>
> Cc: Christian Ruppert <christian.ruppert@abilis.com>
> CC: Francois Bedard <Francois.Bedard@synopsys.com>
> Cc: Joern Rennecke  <joern.rennecke@embecosm.com>
> Cc: Jeremy Bennett <jeremy.bennett@embecosm.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: buildroot at busybox.net
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
> Changes since v2
>    No code changes, added couple more lines to changelog
>
> Changes since v1
> (http://lists.uclibc.org/pipermail/uclibc/2014-March/048273.html
>
> - Rebased to trunk
> - Added handling for h_errno_location
>
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Applied, thanks!
