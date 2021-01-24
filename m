From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 23:33:30 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ssdp-responder: new package
In-Reply-To: <20210124194908.1762833-2-troglobit@gmail.com>
References: <20210124194908.1762833-1-troglobit@gmail.com>
 <20210124194908.1762833-2-troglobit@gmail.com>
Message-ID: <20210124223330.GL2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joachim, All,

On 2021-01-24 20:49 +0100, Joachim Wiberg spake thusly:
> Small (35k), and stand-alone, SSDP responder with built-in web server
> (on port 1901) for serving description.xml when Windows scans for any
> network devices on the LAN.  Also includes ssdp-scan (31k), similar to
> the mdns-scan tool, to probe for SSDP capable devices.
> 
> Verified with check-package and test-pkg, no-mmu builds disabled.

I've done a bit of research as to why noMMU builds were broken.

Initially, you stated:
> +	depends on BR2_USE_MMU # fork()

However, ssdp-responder does not use fork().

So I was a bit surprised, and spawned a test build, and indeed it fails,
but for very obscur reasons. In that situation, a lot of functions, even
very basic ones, like strdup(), do not get prototyped, and a lot of
multicast-related structs, like struct ip_mreq, do not get defined.

I tried to dig the root cause, but I lost too much hair, so I bailed out
and comitted your patch as is, just with the fork() reference dropped.

Applied to master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
