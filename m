From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Feb 2018 23:00:04 +0100
Subject: [Buildroot] [PATCH v2 1/1] support/dependencies: add check for
 c++ multilib
In-Reply-To: <20180205215708.16363-1-gael.portay@savoirfairelinux.com>
References: <20180205215708.16363-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180206220004.GD28439@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, All,

On 2018-02-05 16:57 -0500, Ga?l PORTAY spake thusly:
> Some packages build C++ 32bits host-tools and need the g++-multilib to
> be installed on the build machine. As example, qt5webengine builds a C++
> host-tool when target is 32bits.
> 
> Add the check for g++-multilib to the dependencies script; and update
> the Dockerfile to install g++-multilib package.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

So, this patch was applied, but there is some second-thoughts about it,
especially since not al our autobuilders have g++-multilib for now...

But my concern so far is just about the Dockerfile, see below...

> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index 474e073c61..ce3fdd9cc2 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -22,7 +22,7 @@ COPY apt-sources.list /etc/apt/sources.list
>  RUN dpkg --add-architecture i386 && \
>      apt-get update -y && \
>      apt-get install -y --no-install-recommends \
> -        build-essential cmake libc6:i386 gcc-multilib \
> +        build-essential cmake libc6:i386 g++-multilib \
>          bc ca-certificates file locales rsync \
>          cvs bzr git mercurial subversion wget \
>          cpio unzip \

So, we should not confuse the Dockerfile for what it is not: it is not
meant for user consumption; we never advertised it. Instead, it is only
for use by our gitlab-ci based runtime tests. As such, it should only
include what is needed in that context.

At least for now.

Maybe we will want to make it ready for public consumption later, but it
is not for now.

As such, I don't think we should have updated the dockerfile in the same
patch. Afterall, it is not a mandatory dependency; it is needed (as far
as I can understand) only for qt5webengine.

There are ther optional dependencies that are not in the dockerfile. For
example, we do not have a jave compiler, which is needed by a few
packages in Buildroot, but which are for now not tested by the gitlab-ci
jobs.

So, I would suggest we retract this change in the Dockerfile...

Thoughts from others? Arnout, Thomas, Peter?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
