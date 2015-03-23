From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 23 Mar 2015 12:05:37 +0100
Subject: [Buildroot] Proposed patch: allow setting an hashed root
	password
In-Reply-To: <20150322225625.GB26325@free.fr>
References: <550EDB2A.9030107@sancho.ccd.uniroma2.it>
 <20150322160022.GC4724@free.fr>
 <550EEA7E.8000207@mind.be> <20150322173132.GA5387@free.fr>
 <550F3EDE.8090106@ccd.uniroma2.it> <20150322225625.GB26325@free.fr>
Message-ID: <CAJtjsKZU3p5ScRQH2b+pLPLqP6z82BHeWizHu43EAzBR1N-KXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lorenze, Yann, All,

On Sun, Mar 22, 2015 at 11:56 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Alternatively, you could also tweak the root password from a post-build
> script, see BR2_ROOTFS_POST_BUILD_SCRIPT:
>     http://buildroot.net/downloads/manual/manual.html#rootfs-custom
>
> script which could look something like:
>
>     #!/bin/sh
>     PASSWD='your-encoded-password'
>     sed -r -i -e "s/^root:[^:]+:/root:${PASSWD}:/" "${TARGET_DIR}/etc/passwd"
>
> And in the end, I wonder if that would not be the best option...
>

This is the solution we do internally. I'm not sure how hard it is for
us to send it upstream as it implies several changes. I'll look into
it this week.
Basically, we have a script to ease the access to BR2_* variables
inside post_build scripts, then we have a post_build script that looks
to BR2_TARGET_GENERIC_ROOT_PASSWD and:
- if it's empty, it does nothing;
- if it starts by $1$, $5$, or $6$, it assumes it is already
encrypted, and skip the encoding part
- otherwise, first it encodes it by calling mkpasswd with the
BR2_TARGET_GENERIC_PASSWD_METHOD method, then it replaces the second
field of the root user in the /etc/shadow file

So, one can either put a password in clear text in the .config or an
already encrypted password, which allows us to share a defconfig with
a non-empty password for root.

Best regards,
-- 
Johan
