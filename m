From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Feb 2014 20:54:51 +0100
Subject: [Buildroot] Significant problem with the parallel build patch series
In-Reply-To: <20140228201620.1f4b13ba@skate>
References: <1393605956-18133-1-git-send-email-yann.morin.1998@free.fr>
 <20140228201620.1f4b13ba@skate>
Message-ID: <20140228205451.76e9996f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Feb 2014 20:16:20 +0100, Thomas Petazzoni wrote:

> While I agree with the patch you're proposing, I was wondering which
> patch was introducing the regression. And I didn't find where the
> regression could be coming from. Looking more closely at one of the
> build results, you see that the tarballs are only extracted at the
> make legal-info invocation, which doesn't make any sense: "make" is
> executed before "make legal-info" in the autobuilders. So apparently,
> nothing gets built at all during "make", and it's only at the "make
> legal-info" step that packages are extracted.
> 
> So indeed your patch looks good, but it will not solve the autobuilders
> problems I believe.

Ok, after discussing with Gustavo, he told me that Vicente had already
investigated the problem: it is caused by the parallel build patch
series from Fabio.

The problem is that the autobuilders disable the construction of any
root filesystem image (even the tarball one). And when you disable all
images, then "make all" doesn't do anything (in fact, it runs the
post-image scripts if you have defined any). That's because of the
reorganization of the target dependencies for the parallel build patch
series.

Fabio, which solution would you propose to ensure that packages get
built even if no filesystem image format has been selected?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
