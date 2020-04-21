From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:28:47 +0200
Subject: [Buildroot] [PATCH v2] package/python-pycrypto: fix python3.8
 compatibility
In-Reply-To: <20200420140724.3206074-1-romain.naour@gmail.com>
References: <20200420140724.3206074-1-romain.naour@gmail.com>
Message-ID: <20200421222847.09432773@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 16:07:24 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Apply the patch from Fedora 31 [1][2] to replace the user-space RNG with a
> thin wrapper to os.urandom. This allow to fixes compatibility with
> Python 3.8 since the code containing time.clock() is removed.
> 
> time.clock() was deprecated in Python 3.3 and removed in Python 3.8.
> 
> [1] https://src.fedoraproject.org/rpms/python-crypto/c/a5fd7148fb0e9d5526f24feb1bb708bf203480b9?branch=f31
> [2] https://src.fedoraproject.org/rpms/python-crypto/blob/f31/f/pycrypto-2.6.1-use-os-random.patch
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144209
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> This patch would allow to use python2 and python3.
> To be backported to Buildroot 2020.02 to fixes the qemu-arm-vexpress-tz defconfig.
> ---
>  ...2-pycrypto-2.6.1-use-os-random.patch.patch | 1904 +++++++++++++++++
>  1 file changed, 1904 insertions(+)
>  create mode 100644 package/python-pycrypto/0002-pycrypto-2.6.1-use-os-random.patch.patch

Meh, the Fedora patch is really gigantic. I think the option suggested
by James makes a lot of sense. I think even for 2020.02.x it could be
an acceptable solution. As you said, the only user of
host-python-pycrypto is crda, so it's not a huge effort to quickly test
that it still builds fine on 2020.02.x with python-pycryptodome.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
