From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 25 Apr 2014 23:50:27 +0200
Subject: [Buildroot] [PATCH] Makefile: target-purgelocales: add
	dependencies
In-Reply-To: <20140424184136.572de3d0@skate>
References: <1398356679-1438-1-git-send-email-fabio.porcedda@gmail.com>
 <20140424184136.572de3d0@skate>
Message-ID: <CAHkwnC8p7E8inhY7w+WiFcsZ-_mO26rdTFB8xKvgDrG2bSj0Uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 24, 2014 at 6:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Thu, 24 Apr 2014 18:24:39 +0200, Fabio Porcedda wrote:
>
>> -target-purgelocales:
>> +target-purgelocales: $(filter-out target-purgelocales,$(TARGETS))
>>       rm -f $(LOCALE_WHITELIST)
>>       for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
>
> Don't we have several other targets that need to be executed only after
> all packages have been built and installed? Wouldn't it make sense to
> have a common solution for these? Like maybe a dedicated target?

Can you please give some examples? I know only tatget-purgelocales and
target-finalize.

About the common solution, i see two possible solutions of the problem:

1) all those targets must be listed in a variable like
TARGETS_PRE_ROOTFS, but those targets must be able to be executed in
parallel without a specific order.

2) all those targets must be converted in hooks and added to a
variable like PRE_ROOTFS_HOOKS, so those steps are going to be
executed in serial observing a specific order.

What is the more appropriate solution? The easiest and fastest one is
the first, but i'm not sure if those targets can be executed in
parallel.

Regards
--
Fabio Porcedda
