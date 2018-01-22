From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Jan 2018 22:45:43 +0100
Subject: [Buildroot] Suggestion for Makefile to probably import
 BR2_CONFIG
In-Reply-To: <CAGNmLEM_x8ykDr54gbT94em9YyH5+0ec=jCgjULh68yJLUzjnw@mail.gmail.com>
References: <CAGNmLEM_x8ykDr54gbT94em9YyH5+0ec=jCgjULh68yJLUzjnw@mail.gmail.com>
Message-ID: <1cb3ee33-b12f-6534-9dbf-fb697fbf3482@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi TP,

 Thank you for your suggestion!


On 17-01-18 23:06, Toan Pham wrote:
> 
> 
> Hi,
> 
> I would like to make a suggestion on patching the main Makefile line:?
> 
> BR2_CONFIG = $(CONFIG_DIR)/.config??
> 
> to
> 
> BR2_CONFIG ?= $(CONFIG_DIR)/.config
> 
> 
> The main reason for this patch is that it allows the configuration file to be
> specified from command argument.? For example, I would be able to build two
> different targets (even in parallel) with the following commands:
> 
> 
> make BR2_CONFIG=$PWD/myTarget1 O=output.target1
> 
> make BR2_CONFIG=$PWD/myTarget2 O=output.target2
>
>
> Without the above patch, buildroot assumes that the config file is already saved
> under output.target{1,2}/.config and would fail if the file does not exist.? I
> find that the above patch is very valuable, please comment or make suggestion!

 The .config file is a generated file. In fact, it will sometimes be overwritten
when you start a build. The .config files also contains information about your
build environment. So no, it really isn't a good idea to do this.

 If you have an existing defconfig file (normally generated with 'make
savedefconfig', but you can also just copy the .config file), you can use it as
the source of the generated .config as follows:

make BR2_DEFCONFIG=$PWD/myTarget1 O=output.target1
make O=output.target1


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
