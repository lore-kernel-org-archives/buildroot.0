From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 19 May 2020 17:10:31 -0500
Subject: [Buildroot] [Next] package/haveged: set write_wakeup_threshold
 to 2048
In-Reply-To: <20200512233923.20290-1-matthew.weber@rockwellcollins.com>
References: <20200512233923.20290-1-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpbtviLRMm+c8bRPMefRObTygAD-XzWbO7Y1y4Di545mYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, May 12, 2020 at 6:39 PM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Adjust the low water mark to wake-up the haveged daemon at the
> same time that rngd would wake-up when a hardware RNG is present.
>
> This supports the theory that rngd then can't dominate the entropy
> pool. Instead haveged and rngd would complete to fill the pool.
> https://tails.boum.org/contribute/design/random/#index5h2
>
> If rngd isn't enabled or there isn't a hardware RNG, this change
> should not impact the behavior of the entropy pool other then
> the pool should be less likely to deplete and cause an entropy
> starve with haveged filling it earlier

I marked this as a Next item but I guess it really is sort of a bug
that should be merged before release as I believe it should apply to
LTS as well.
.
>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>
> Peter I believe this one also applys to 2020.02.x
> ---
>  package/haveged/S21haveged | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/haveged/S21haveged b/package/haveged/S21haveged
> index 4b6e6ced4e..22b84e4f27 100644
> --- a/package/haveged/S21haveged
> +++ b/package/haveged/S21haveged
> @@ -3,7 +3,7 @@
>  case "$1" in
>         start)
>                 printf "Starting haveged: "
> -               start-stop-daemon -S -x /usr/sbin/haveged -- -w 1024 -r 0
> +               start-stop-daemon -S -x /usr/sbin/haveged -- -w 2048 -r 0
>                 [ $? = 0 ] && echo "OK" || echo "FAIL"
>                 ;;
>         stop)
> --
> 2.17.1
>


-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.


ALPHA BRAVO COLLINS | Aerospace Redefined

         __ l __

 \- - - -o-(_)-o- - - -/
