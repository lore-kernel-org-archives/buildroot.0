From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 28 Sep 2007 09:35:45 +0200
Subject: [Buildroot] AVR32 misery
In-Reply-To: <1190938123.5322.54.camel@elrond.atmel.sweden>
References: <1190938123.5322.54.camel@elrond.atmel.sweden>
Message-ID: <1190964945.5322.87.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-09-28 klockan 02:08 +0200 skrev Ulf Samuelsson:
> I think I have found one problem
> "toolchain_build_avr32/gcc-4.1.2-initial/gcc/as" is a script file
> which should call the assembler.
> 
> It contains
> 
> #!/bin/sh
> exec "$@"
> 
> and should contain:
> #!/bin/sh
> exec <buildroot>/build_avr32/staging_dir/bin/avr32-linux-uclibc-ld "$@"
> 
> I modified this by hand, and now it seems to continue further.
> Off to bed...
> 

When gcc-4.1.2 is build
"toolchain_build_avr32/gcc-4.1.2-initial/gcc/<app>" contains

app=as
#!/bin/sh
exec  "$@"

app=collect-ld
#!/bin/sh
exec <buildroot>/build_avr32/staging_dir/avr32-linux-uclibc/bin/ld "$@"

app=nm
#!/bin/sh
exec /usr/bin/nm "$@"

------
I am changing all to:

#!/bin/sh
exec <buildroot>/build_avr32/staging_dir/avr32-linux-uclibc/bin/<app>
"$@"

> BR
> Ulf Samuelsson
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
