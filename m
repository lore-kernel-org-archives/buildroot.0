From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Thu, 25 Jan 2007 09:50:29 -0700
Subject: [Buildroot] Make problems
In-Reply-To: <D10BFA8BB60FBC43849BFB49875965CC02D9C4@MCHP7IEA.ww002.siemens.net>
References: <D10BFA8BB60FBC43849BFB49875965CC02D9C4@MCHP7IEA.ww002.siemens.net>
Message-ID: <45B8DFD5.9040403@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kleegrewe, Christian wrote:
>
> And my hello.mk File
>
> #############################################################
> #
> # Any custom stuff you feel like doing....
> #
> #############################################################
> HELLO_DIR=package/hello
> HELLO_SOURCE_DIR=$(HOME)/embedded_p2p/hello
> HELLO=hello
> HELLO_BINARY=hello
>
> $(HELLO):
>         -cp -af $(HELLO_SOURCE_DIR)/* $(HELLO_DIR)/
>         touch $@
>         touch -c $(HELLO_DIR)/hello.cpp
>
> $(HELLO_DIR)/$(HELLO_BINARY): $(HELLO_DIR)/hello.cpp $(HELLO_DIR)
>         $(MAKE) CFLAGS="$(TARGET_CFLAGS)" DEBUG=true KLIBC=false \
>             KERNEL_INCLUDE_DIR=$(STAGING_DIR)/include \
>             TARGET_DIR=$(TARGET_DIR) -C $(HELLO_SOURCE_DIR) -o 
> $(HELLO_BINARY);
>

if you look at other makefiles in buildroot, you'll see usually the last 
line (though position isn't important)

programname: $(PROGRAM_DIR)/$(TARGET_BINARY) ....

make deals with dependancies and dependency trees, so the line is like so

target: dependancy1 dependancy2
      tasks for target
      tasks for target

dependancy1: dependancy3
     tasks for dependency1

dependancy2:
    tasks for dependency2

dependancy3:
    tasks for dependency3


if I used this makefile directly and did `make target` I would get
tasks for dependency3
tasks for dependency1
tasks for dependency2
tasks for target

so with your makefile, you've made the end target of program name = 
hello, the only thing to run. In your
ifeq ($(strip $(BR2_PACKAGE_HELLO)),y)
TARGETS+=hello
Endif

hello: is added as a target, but your makefile has hello: as a 
dependency free target. it does the first part, but that is it. so 
change it so it is something like
$(HELLO_DIR):
    mkdir $(HELLO_DIR)

$(HELLO_DIR)/hello.cpp: $(HELLO_DIR)
    tasks including your touch $HELLO_DIR/hello.cpp

$(HELLO_DIR)/$(HELLO_BINARY): $(HELLO_DIR)/hello.cpp
       tasks...

hello: $(HELLO_DIR)/$(HELLO_BINARY)
