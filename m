From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Mon, 27 Jan 2014 13:47:49 +0200
Subject: [Buildroot] i686-buildroot-linux-gnu-as  does not work
In-Reply-To: <255977954.4763389.1390820376074.JavaMail.root@openwide.fr>
References: <255977954.4763389.1390820376074.JavaMail.root@openwide.fr>
Message-ID: <52E64765.5010803@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain, Kirill,

On 01/27/2014 12:59 PM, Romain Naour wrote:
> I had the same problem with infozip and I fixed this error by patching unix/Makefile like this:
(...)
> match.o: match.S
>   $(CPP) match.S > _match.s
> - $(AS) _match.s
> - mv _match.o match.o
> - rm -f _match.s
> + $(AS) _match.s -o match.o
(...)
> (Ok, this patch is really weird...)
Why?

To me it seems that $(AS) should not be expected to output by default to <basename>.o, as is
apparently expected in the infozip's unix/Makefile. GNU as outputs to a.out by default.

If I build the package in my host environment, it picks "$(CC) -c" as the value for $(AS) and
works OK but when called from Buildroot, the value for $(AS) is set to invoke the toolchain's
as directly, and the output of it goes to a.out.

Am I totally wrong in believing that your patch is the right way to produce match.o rather
than original way of doing it?

--
Best regards,
  Alexander Lukichev
