From: Alexander Dahl <post@lespocky.de>
Date: Mon, 8 Jun 2020 10:38:29 +0200
Subject: [Buildroot] [PATCH] package/haveged: Allow service to run early
In-Reply-To: <CADYdroOVGUozgyP258MinUAtznRSRSw-SvrGbD7ZGkqAVdfQJw@mail.gmail.com>
References: <CAFvCimWgEF5hx+LXPasKNSP59CU2RqU-22iLkMQb_9QQRDk=mA@mail.gmail.com>
 <CADYdroM-mpaz+7zqGMnKJ5J=sJL-TiAQOXs_vieW6ts77=VBHQ@mail.gmail.com>
 <CAFvCimVmWczV2XjFsx=De3Q1ZCLxSTOu9etaFqN9z54cv0ACyw@mail.gmail.com>
 <CADYdroPOE148vzGPNQhBX3mb3tAVK0d-D4vt89rrphK=zfbzxQ@mail.gmail.com>
 <CAFvCimUXkpkYLQ8mfhvAzTcHJ14Vs4queFjipCRNkZsVyCmP=g@mail.gmail.com>
 <CADYdroPU=MZa4RCqoS9TrF89jKp2vNXGggMp3iGri8F8DAp02A@mail.gmail.com>
 <CAFvCimUod4o5Yk0UqtrgymKSD3vTMMMuT-XhNm+g4kmmysdQ4Q@mail.gmail.com>
 <CADYdroNrgMbYrmLqRmCSobfNnQTtjN4ZfYYViS6JAdMYTZAEbA@mail.gmail.com>
 <CAFvCimWLcZxrusY5ig1fRxj-SQFQsKvxajJh_s-9==bm1ATo+w@mail.gmail.com>
 <CADYdroOVGUozgyP258MinUAtznRSRSw-SvrGbD7ZGkqAVdfQJw@mail.gmail.com>
Message-ID: <20200608083829.dm3kjkjo2q2j3xd3@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

I'd like to hook in, because I had that topic on my desk lately
(although not with buildroot).

On Sun, Jun 07, 2020 at 10:36:18PM +0200, Norbert Lange wrote:
> > I mean... if it's not high grade entropy, it shouldn't credit the kernel entropy
> > pool,and if the user is ok with unreliable entropy, systemd-random-seed is
> > probably a faster way to get some.
> 
> 
> haveged is barely entropy, certainly not more than the kernel
> provides, it is a means to fake entropy. Gets you to boot faster.

Well, the system can boot faster, because haveged provides entropy
from unpredictable internal CPU states. It's not just another PRNG.

> systemd-random-seed needs a filesystem to store stuff, does not credit
> the entropy pool (by default).. and won't help at all when booting the
> first time.
> 
> I think what you have in mind is more like rng-tools, which feed real,
> quality entropy to the kernel.

rng-tools can not do that by itself, but needs a real HWRNG or
something like jitterentropy-rng (which gets its entropy from CPU
execution timing jitter). So rng-tools alone doesn't help you,
especially if your hardware has no hwrng.

> The user should pick what he needs, haveged will never give you better
> entropy over the kernel or real HW sources,  systemd-random-seed will
> not let you boot faster (by default).

I'm curious, where do you think the kernel gets entropy from? ;-)

What you all might find interesting: newer OpenSSL versions, I think
from some 1.1.1 bugfix release onwards block until the kernel has
initialized its crng.  The upcoming (not yet released) dropbear will
do that, too. Both don't rely on /dev/urandom for that but on the
getrandom(2) syscall IIRC. Without having looked in systemd source, I
would guess they do something similar?

So, it's complicated ? ;-)

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200608/7ae2d73a/attachment.asc>
