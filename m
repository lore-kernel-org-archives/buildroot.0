From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 17 Feb 2016 13:00:26 +0900
Subject: [Buildroot] [Question] Including only needed makefiles?
Message-ID: <CAK7LNAQNQp_zm-QFyaMhtPtJt+h3BkiwEasXTc6twFm5W_dUnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi expert.

I am not an active developer of Buildroot.
Apology if I am asking a silly question.


It takes a few seconds for Buildroot to start building things
after executing "make".

I think it is because Buildroot parses all the makefiles
included by the following wildcard pattern:

include $(sort $(wildcard package/*/*.mk))


Some of them are really needed to build desired packages,
but most of them are not necessary at all.



I found commit 863036378b257d9a9eb9908322edaf29f2121ae7
("package/c-libraries: need linux-headers").

This commit added the dependency to Kconfig
rather than leaving it to Makefile.


I have two questions.


[1]

Are we going towards inter-package dependency in Kconfig
rather than in Makefiles?



[2]
If we achieve the perfect dependency in Kconfig,
perhaps can we include makefiles that are really
enabled by Kconfig?   For example, like this?


pkg-$(BR2_PACKAGE_BUSYBOX) += busybox
pkg-$(BR2_PACKAGE_LAME)    += lame
pkg-$(BR2_PACKAGE_GZIP)    += gzip
   ...


include $(addprefix packages, $(addsuffix Makefike, $(pkg-y)))




I understand this is too big change,
and I am not sure if it will work well or not.

But, including only needed makefiles would improve
the response of "make" anyway.


-- 
Best Regards
Masahiro Yamada
