From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 16 Sep 2014 01:20:48 +0200
Subject: [Buildroot] [PATCH] unbound: new package
In-Reply-To: <1410813982-7774-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1410813982-7774-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1410813982-7774-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <54177450.3090909@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 09/15/2014 10:46 PM, Eric Le Bihan wrote:
> This package provides Unbound, a validating, recursive, and caching DNS
> resolver.

Nice addition.
We're an unbound user as well, but never got around to submitting our 
local package, and I know unbound has some odd issues.


Some points:

- Unbound (at least when using your package with sysv) currently creates 
a pid file in /etc/unbound/unbound.pid
Suggest that to be changed to /var/run/unbound.pid, so it also works on 
read-only file systems.

- Unbound is currently broken when IPv6 is disabled in the buildroot 
configuration.

Listens on both 127.0.0.1 and ::1 by default, and errors out on the ::1

==
unbound[118:0] error: node ::1:53 getaddrinfo: ai_family not supported
[13] unbound[118:0] fatal error: could not open ports
FAIL
==

You do can override the default by specifying "interface: 127.0.0.1" in 
unbound.conf but then it errors out on:

==
"error: cannot parse access control: ::0/0 refuse"
==

Don't no how to override that internal ACL rule.
Might need to let the package depend on IPv6


- Unbound is typically used as local resolving nameserver.
I was wondering if the startup script shouldn't put "nameserver 
127.0.0.1" in /etc/resolv.conf
Possibly with an option to turn that off by a setting in 
/etc/default/unbound

- Unbound expects /etc/unbound to be owned by user unbound
Or if you do enable DNSSEC by uncommenting the "auto-trust-anchor-file" 
line in /etc/unbound/unbound.conf, you get errors that it is unable to 
create files:

==
error: could not open autotrust file for writing, /root.key.306-0: 
Permission denied
==

- I also wonder if there shouldn't be an option to let the startup 
script run unbound-anchor prior to starting the unbound daemon.
This updates the DNSSEC trust anchor files.
(Enabling DNSSEC validation has some caveats though, in particular it 
requires the system to have correct date/time settings, so should be 
left disabled by default)

> +NAME=nsd

nsd -> unbound

> +UNBOUND_DEPENDENCIES = expat libevent openssl

libevent is an optional dependency. (don't have it in my local package)

> +++ b/package/unbound/S80unbound

- Wondering if S80unbound shouldn't be a lower number like S41 for 
systems that intend to use it as local resolver.
So that other services like S49ntp can use it to resolve pool.ntp.org.


Yours sincerely,

Floris Bos
