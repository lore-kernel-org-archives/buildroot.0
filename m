From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:39:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: fix build on sparc
In-Reply-To: <20190715163608.1903-1-fontaine.fabrice@gmail.com>
References: <20190715163608.1903-1-fontaine.fabrice@gmail.com>
Message-ID: <20190717083915.088b2898@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jul 2019 18:36:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gnutls source code uses the C++11 <atomic> functionality since
> https://github.com/gnutls/gnutls/commit/7978a733460f92b31033affd0e487c86d66c643d,
> which internally is implemented using the __atomic_*() gcc built-ins
> 
> On certain architectures, the __atomic_*() built-ins are implemented in
> the libatomic library that comes with the rest of the gcc runtime. Due
> to this, code using <atomic> might need to link against libatomic,
> otherwise one hits build issues such as:
> 
> ../lib/.libs/libgnutls.so: undefined reference to `__atomic_fetch_sub_4'
> 
> on an architecture like SPARC.
> 
> To solve this, link against libatomic if BR2_PACKAGE_HAS_LIBATOMIC is set.
> 
> This fix gnutls build failures as well as cups, gnupg and libmicrohttpd
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1c7541fc6ac4b52d1dfe02a9a7d61db90f4521eb
>  - http://autobuild.buildroot.org/results/42c8803b98e38ebd48870fe6b1a20a1d6c351e5f
>  - http://autobuild.buildroot.org/results/a1e96d02d41f7fec0f5327f65fb34405f963a1e9
>  - http://autobuild.buildroot.org/results/59c92706457a9da29dd44425e546a7c80c18b454
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnutls/gnutls.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
