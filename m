From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 22:28:16 +0100
Subject: [Buildroot] [PATCH 1/3] vala: add vala/valac wrapper
In-Reply-To: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
References: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160221222816.4e53e921@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Tue,  2 Feb 2016 13:01:46 -0300, Gustavo Zacarias wrote:

> +# We wrap vala & valac to point to the proper gir and vapi data dirs
> +# Otherwise we'll get host directory data which isn't enough
> +define HOST_VALA_INSTALL_WRAPPER
> +	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
> +		$(HOST_DIR)/usr/bin/vala
> +	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
> +		$(HOST_DIR)/usr/bin/valac
> +	$(SED) 's, at VALA_VERSION@,$(VALA_VERSION_MAJOR),' \
> +		$(HOST_DIR)/usr/bin/vala
> +	$(SED) 's, at STAGING_DIR@,$(STAGING_DIR),g' \
> +		$(HOST_DIR)/usr/bin/vala
> +	$(SED) 's, at VALA_VERSION@,$(VALA_VERSION_MAJOR),' \
> +		$(HOST_DIR)/usr/bin/valac
> +	$(SED) 's, at STAGING_DIR@,$(STAGING_DIR),g' \
> +		$(HOST_DIR)/usr/bin/valac
> +endef
> +HOST_VALA_POST_INSTALL_HOOKS += HOST_VALA_INSTALL_WRAPPER

So if I understand correctly, the idea is to replace the vala ->
vala-3.0 and valac -> valac-3.0 symbolic links by wrappers.

So I did a test, first without your patch, with a stupid vala hello
world program:

thomas at skate:~/projets/buildroot (next)$ cat > pouet.vala
class Demo.HelloWorld : GLib.Object {

    public static int main(string[] args) {

        stdout.printf("Hello, World\n");

        return 0;
    }
}
thomas at skate:~/projets/buildroot (next)$ ./output/host/usr/bin/vala pouet.vala 
Hello, World
thomas at skate:~/projets/buildroot (next)$ ./output/host/usr/bin/valac pouet.vala 
thomas at skate:~/projets/buildroot (next)$ file pouet
pouet: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=d13ab11a4b8d24623f8ead3e8e3c1c9e73d16df0, not stripped

So, the program runs fine on the host with "vala", and compiles to a
x86-64 executable. Not really surprising since it's a host-vala
installation not tuned for cross-compilation.

Then, I apply your patch, rebuild host-vala, and do the same test:

thomas at skate:~/projets/buildroot (next)$ ./output/host/usr/bin/vala pouet.vala 
error: --girdir=/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/gir-1.0 not found

What package is supposed to install gir-1.0 in staging ?

thomas at skate:~/projets/buildroot (next)$ ./output/host/usr/bin/valac pouet.vala 
thomas at skate:~/projets/buildroot (next)$ file pouet
pouet: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=d13ab11a4b8d24623f8ead3e8e3c1c9e73d16df0, not stripped

But it still compiles to a host binary. Am I missing something ?

Could you improve the commit log with more explanations for people
(like me) who don't know vala, and don't understand what your patch is
fixing exactly ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
