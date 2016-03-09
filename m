From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 16:55:08 +0100
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <CAHXCMMJS=QknbFiVxvNLKHp0QZi2_LtJ+jnRz-XEYgsfAQh6pw@mail.gmail.com>
 (Samuel Martin's message of "Wed, 9 Mar 2016 16:22:34 +0100")
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk> <56E02A78.1050701@zacarias.com.ar>
 <20160309150359.4ce78c05@free-electrons.com>
 <CAHXCMMJS=QknbFiVxvNLKHp0QZi2_LtJ+jnRz-XEYgsfAQh6pw@mail.gmail.com>
Message-ID: <87k2lbzlwj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

Hi,

 >> What about doing this relatively to the wrapper location?
 >> 
 >> WRAPPER_DIR=$(dirname $0)
 >> STAGING_DIR=$(readlink -f ${WRAPPER_DIR}/../../../staging/)
 >> 
 >> and there you are, it is both relocatable and doesn't rely on
 >> STAGING_DIR being defined in the environment.

 > Funny that's close to what I've done in my relocatable sdk branch few
 > days ago...
 > https://github.com/tSed/buildroot/commit/cebeb4f43a44eda8e9c1d2fd9629e9f9deea3f28

Heh, great minds think alike ;)

Something else more-or-less related that I think we should
fix/workaround until the relocatable sdk rpath handling gets integrated
is the issue about the toolchain linking to gmp/mpc/mpfr, and not
finding our libraries when the toolchain is moved.

That is currently quite painful, especially when you want to reuse the
toolchain on different machines/distributions, that may not have
compatible libraries in /usr/lib.

The easiest workaround is just to build our host-gmp/mpc/mpfr statically
for now. This has minimal size impact on the toolchain (< 1MB for a
.tar.gz of output/host).

-- 
Bye, Peter Korsgaard
