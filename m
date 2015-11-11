From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Nov 2015 13:52:15 +0100
Subject: [Buildroot] [PATCH 3/3] package/skeleton: ensure custom
 skeleton uses merged /usr if needed
In-Reply-To: <87d1vhphi7.fsf@dell.be.48ers.dk>
References: <cover.1447190450.git.yann.morin.1998@free.fr>
 <d667c39209bc260f60546ee0b9e7f5a661c4b761.1447190450.git.yann.morin.1998@free.fr>
 <87d1vhphi7.fsf@dell.be.48ers.dk>
Message-ID: <20151111125215.GA3968@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-11-11 00:22 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > When using systemd, the poolicy in Buildroot is to use a merged /usr
>  > (see c5bd8af6, "system: add options for /bin /sbin and /lib to be
>  > symlinks into /usr" for more info). So, we apply a few tricks in some
>  > packages to account for the merged /usr case.
> 
>  > However, when using a custom skeleton, we have no say in how that
>  > skeleton is organised, so it may well have a split /usr. In that case,
>  > our little tricks might not work as expected.
> 
>  > So, when the user uses a custom skeleton and wants systemd as an init
>  > system, we must check that the custom skeleton is setup with a merged
>  > /usr.
> 
>  > We do that by checking that each pair of {/lib,/usr/lib} {/bin,/usr/bin}
>  > and {/sbin,/usr/sbin} have the same inode numbers, i.e. /lib must have
>  > the same inode number as /usr/lib (and so on...). When a pair does not
>  > share the same inode number, this is not a merged /usr and we abort.
> 
>  > We implement that check with make constructs, so it is done very early
>  > in the build process, and we can abort early if need be.
> 
> Nice. It doesn't handle cases where absolute symlinks are used
> (E.G. /bin -> /usr/bin), but I don't see how we can fix that.

In that situation, then target/bin would indeed point to /usr/bin would
point to the host's /usr/bin and that would break horribly as soon as a
package would try to install something in there.

Well, that is not a change from the previous behaviour. that case was
broken (aka unsupported) previously, it is still broken.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
