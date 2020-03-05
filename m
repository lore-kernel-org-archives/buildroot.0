From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 5 Mar 2020 16:33:16 -0300
Subject: [Buildroot] [PATCH] package/busybox: Add patches for glibc-2.31
 compatibility
In-Reply-To: <20200210075111.16738-1-Evgeniy.Didin@synopsys.com>
References: <20200210075111.16738-1-Evgeniy.Didin@synopsys.com>
Message-ID: <CAJ4jsaeB-xDWvktj0=5SD3qV=1m5DKkTXSf7upe5t9Zc-ZHp9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 10, 2020 at 4:52 AM Evgeniy Didin
<Evgeniy.Didin@synopsys.com> wrote:
>
> Current release of busybox 1_31_1 is failing to build with glibc-2.31
> due to removal of stime() from glibc. This commit adds two patches:
> one that removes stime() function calls and one prerequisite for fixing
> patch.
>
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  ...e-the-overhead-of-single-parameter-bb_err.patch | 7635 ++++++++++++++++++++
>  .../busybox/0004-Remove-stime-function-calls.patch |   93 +
>  2 files changed, 7728 insertions(+)
>  create mode 100644 package/busybox/0003-libbb-reduce-the-overhead-of-single-parameter-bb_err.patch
>  create mode 100644 package/busybox/0004-Remove-stime-function-calls.patch
>

Some additional patches are required to deal with the
__NR_clock_gettime issue with musl:

    http://autobuild.buildroot.net/results/f45f91aea6deee6699eabdfa618ac44873b8da51/

The required upstream commits are

  - 6937487be73cd4563b876413277a295a5fe2f32c
  - b7b7452f292f03eefafa6fd1da9bcfc933dee15a
  - 902d3992922fc8db8495d5fb30a4581711b60c62
  - ad27d44ebe950335616f37e36863469dc181b455
  - be5a505d771a77c640acc35ceaa470c80e62f954
  - d3539be8f27b8cbfdfee460fe08299158f08bcd9

Fortunately only the first patch is large (7635 lines). The subsequent
ones are quire small.

-- 
Carlos Santos <unixmania@gmail.com>
