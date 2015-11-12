From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu, 12 Nov 2015 16:31:29 +0100
Subject: [Buildroot] [PATCH v2] python3: add patch to fix PEP 3147 issue
 with automake built packages
In-Reply-To: <20151105000420.5abc2ee1@free-electrons.com>
References: <1441023704-27725-1-git-send-email-cvubrugier@fastmail.fm>
 <20151104225541.15eef643@free-electrons.com>
 <20151105000420.5abc2ee1@free-electrons.com>
Message-ID: <20151112163129.4adc5852@PAL-U515208D001>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 5 Nov 2015 00:04:20 +0100, Thomas Petazzoni wrote :
> In fact, it seems that this patch might be causing some Python 3 build
> issues. See
> http://autobuild.buildroot.org/results/06e/06e7c654a10a7618c0c64c57bfd9f27e770138fc/build-end.log.
> 
> Can you have a look?

Sorry for the late reply.

Here is a short explanation for the error. The Makefile defines a rule
to regenerate "Python/importlib.h" if "Lib/importlib/_bootstrap.py" is
modified using a C helper named `_freeze_importlib`. Since
"_boostrap.py" is modified by my patch, the rule is invoked. The
problem is that the helper is built for the target so it cannot be
executed on the host.

If I understand correctly "importlib.h" is a frozen module: it contains
bytecode generated from "_bootstrap.py". It is only used by a dummy
"frozen.c" program.

I see two options:

1/ Patch the Makefile to invoke a version of `_freeze_importlib` built
   for the host.
2/ Simply do not regenerate "importlib.h" because it is not used.

I would favor the second option.

With best regards,

-- 
Christophe Vu-Brugier
