From: Tomohiro Masubuchi <bucchi@e-ml.jp>
Date: Fri, 08 Jun 2007 13:52:43 +0900
Subject: [Buildroot] problem with openssh
In-Reply-To: <20070606235535.ddc532ee.philippe.ney@pardes.ws>
References: <e19d85410706050700s69e06497gef032dddb6eef9c9@mail.gmail.com>	<e19d85410706051935j42739782ndf1307022f2e9031@mail.gmail.com>	<20070606100917.e0724deb.philippe.ney@pardes.ws>	<e19d85410706060839l6baf072cte7a5c9c9d58b67ab@mail.gmail.com>	<e19d85410706061235g63cadda9s364849b0737a39ec@mail.gmail.com>
	<20070606235535.ddc532ee.philippe.ney@pardes.ws>
Message-ID: <4668E09B.1000200@e-ml.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Elia Yehuda wrote:
> Ive been trying to compile openssh using buildroot, and just like
> samba, it compiles fine but any executable halts with "segmentation
> fault".

I found out that the cause of this problem originated in
__progname = NULL in uClibc-0.9.29.

The UCLIBC_HAS___PROGNAME is enabled in uClibc-0.9.29.config,
but UCLIBC_HAS_PROGRAM_INVOCATION_NAME is disabled.

Under this condition, it seems to become __progname = NULL. (uclibc's bug??)

In uClibc-0.9.28.config, both UCLIBC_HAS_PROGRAM_INVOCATION_NAME and
UCLIBC_HAS___PROGNAME is not exist. These become disabled.
In this case, symbol __progname was not exist. Then openssh will be
configured to not use __progname. Therefore this problem doesn't
happen in uClibc-0.9.28.

To solve this problem in uClibc-0.9.29, the following sentences of
toolchain/uClibc/uClibc-0.9.29.config are changed, and rebuild uclibc.

# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set

to

UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y

It works fine with arm(iwmmxt), gcc-4.2.0, binutils-2.17.50.0.16,
uClibc-0.9.29.

Tomohiro
