From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Sep 2009 12:19:57 +0200
Subject: [Buildroot] [PATCH 3/5] By default,
	put the output in an output/ directory
In-Reply-To: <c27ac42abbb6951472debf9feceb523f37119bef.1252361088.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue\,
	8 Sep 2009 00\:09\:51 +0200")
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<c27ac42abbb6951472debf9feceb523f37119bef.1252361088.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ab141ktu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Instead of putting all the build-related stuff as a mess in the
 Thomas> Buildroot sources, group them in an output/ directory.

 Thomas>  # Buildroot supports building out of tree similarly to the Linux kernel.
 Thomas>  # To use, add O= to the make command line (make O=/tmp/build)
 Thomas> -BASE_DIR:=$(shell pwd)
 Thomas> -ifdef O
 Thomas>  ifeq ("$(origin O)", "command line")
 Thomas>  BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
 Thomas>  $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 Thomas> @@ -228,7 +226,8 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 Thomas>  # forwards command line variable definitions those packages get very
 Thomas>  # confused. Fix this by telling make to not do so
 Thomas>  MAKEOVERRIDES =
 Thomas> -endif
 Thomas> +else
 Thomas> +BASE_DIR := $(shell mkdir -p output && cd output && pwd)
 Thomas>  endif

Wouldn't it be simpler to just pretend we were passed O=output by
default? E.G:

ifneq ("$(origin O)", "command line")
O:=output
endif

BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
...

-- 
Bye, Peter Korsgaard
