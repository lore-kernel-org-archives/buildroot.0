From: George Redivo <george.redivo@datacom.ind.br>
Date: Tue, 7 Jul 2015 12:06:21 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.1
In-Reply-To: <20150630164814.3d7c2bdc@free-electrons.com>
References: <1434995939-8236-1-git-send-email-george.redivo@datacom.ind.br>
 <CANQCQpYy-kuZLfMjO0YrX8Kfa25eLUa09U-NUyOSQjxE0vq5WA@mail.gmail.com>
 <1313674444.2327407.1435171914537.JavaMail.zimbra@datacom.ind.br>
 <20150630164814.3d7c2bdc@free-electrons.com>
Message-ID: <384071235.534705.1436281581599.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas.

I could not reproduce this error.
I inserted these flags in .config and followed exactly what you sad, but it worked fine.

I looked the code and I found 2 interesting things:

1) There is a syntax error in a protobuf's header file. The code that should generate an error message is broke and generates a compilation error itself.

2) Anyway, at this point it has to generate an error (at least it was the intention). This error is trigged by compiler version. It looks that it is exacltly the your problem.


So to the problem (1), I fixed the wrong syntax and I've done a pull request on Google Protobuf. I have a patch for this.
May I include it in this Buildroot patch?

And to the problem (2), maybe the problem is your compiler version. Would you let me know your compiler version?
If this problem is really this, I'll try to do the protobuf dependent to GCC version.

Thanks


George Redivo 
DATACOM 
Ethernet Switches 
Rua Am?rica, 1000 - Eldorado do Sul, RS 
Ramal: 3444 
george.redivo at datacom.ind.br 
www.datacom.ind.br

----- Mensagem original -----
De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
Para: "DATACOM" <george.redivo@datacom.ind.br>
Cc: "Peter Korsgaard" <jacmet@gmail.com>, "buildroot" <buildroot@buildroot.org>
Enviadas: Ter?a-feira, 30 de junho de 2015 11:48:14
Assunto: Re: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.1

Dear George Redivo,

On Wed, 24 Jun 2015 15:51:54 -0300 (BRT), George Redivo wrote:

> I looked to the ola's Config.in file and there is no powerpc dependency declared in there. 
> So I'm not sure if it's valid to try to make a build to powerpc arch including this package. Is it? 

I think Peter added || BR2_powerpc in ola/Config.in. The ola package
itself does not have any architecture dependency, it only has such
dependencies because it selects protobuf. So if protobuf now supports
PowerPC, then it should also be possible to build Ola.

And anyway, the error reported by Peter occurred during the build of
protobuf itself, so Ola is not relevant here.

> Anyway, I tried to reproduce the reported error by adding those flags in my .config file. 
> In addition, I removed BR2_powerpc_8548=y, that was declared. 
> 
> I ran make olddefconfig and the .config changed. 
> The BR2_PACKAGE_OLA flag simply dropped out from the .config file. 
> 
> May you send me your entire .config after running make olddefconfig please? 

Just do:

$ cat > .config <<EOF
BR2_powerpc=y
BR2_powerpc_603e=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_OLA=y
EOF

and then:

$ make olddefconfig
$ make

As explained by Peter.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
