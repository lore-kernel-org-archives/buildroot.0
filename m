From: Marco Pastorelli <mpastorelli@gmail.com>
Date: Mon, 4 Aug 2014 14:48:09 +0200
Subject: [Buildroot] How to build a makefile based package?
Message-ID: <CAFRxoJmD_4gCJ3xcdVLF9D_ak8VdBAOf9vi3ivXE+GKb3J9xxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

I'm trying to add a custom "hello world" package containing a makefile.
So I wrote a local package containing the source code and the makefile:

marco at xeon:/tmp/hello-world$ tree
.
??? Makefile
??? src
    ??? hello-world.cpp


Hereafter the makefile:

marco at xeon:/tmp/hello-world$ cat Makefile
CC = $(CROSS_COMPILE)g++
override CXXFLAGS += -Wall

SRC = $(wildcard src/*.cpp)
OBJ = $(patsubst src/%.cpp, %.o, $(SRC))
EXEC = hello

all: $(EXEC)

$(EXEC):$(OBJ)
$(CC) $(CXXFLAGS) $(LDFLAGS) -o $@ $^

%.o: src/%.cpp
$(CC) $(CXXFLAGS) -c $< -o $@

.PHONY: all clean

clean:
rm -f *.o $(EXEC)


Everything works fine when I export the toolchain and I run make from the
local package directory

marco at xeon:/tmp/hello-world$ make
CXXFLAGS?=--sysroot=/home/marco/projects/bb-buildroot-2014.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot
CROSS_COMPILE=arm-linux-gnueabihf- all
arm-linux-gnueabihf-g++
--sysroot=/home/marco/projects/bb-buildroot-2014.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot
-Wall -c src/hello-world.cpp -o hello-world.o
arm-linux-gnueabihf-g++
--sysroot=/home/marco/projects/bb-buildroot-2014.05/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot
-Wall  -o hello hello-world.o
marco at xeon:/tmp/hello-world$


I wrote the following .mk file to let buildroot build the hello world
package:

marco at xeon:~/projects/bb-buildroot-2014.05$ cat
package/custom-packages/hello-world/hello-world.mk
################################################################################
#
# hello-world
#
################################################################################

HELLO_WORLD_VERSION = 1.0.0
HELLO_WORLD_SITE = /tmp/hello-world
HELLO_WORLD_SITE_METHOD = local
HELLO_WORLD_INSTALL_STAGING = NO

define HELLO_WORLD_BUILD_CMDS
$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define HELLO_WORLD_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0755 $(@D)/hello $(TARGET_DIR)/usr/lib
endef

$(eval $(generic-package))
marco at xeon:~/projects/bb-buildroot-2014.05$


But when I try to compile with buildroot I ran into the following error:

marco@xeon:~/projects/bb-buildroot-2014.05$ make
>>> hello-world 1.0.0 Building
/usr/bin/make -j9
CC="/home/marco/projects/bb-buildroot-2014.05/output/host/usr/bin/arm-linux-gnueabihf-gcc"
LD="/home/marco/projects/bb-buildroot-2014.05/output/host/usr/bin/arm-linux-gnueabihf-ld"
-C /home/marco/projects/bb-buildroot-2014.05/output/build/hello-world-1.0.0
all
make[1]: Entering directory
`/mnt/ocz-vector/projects/bb-buildroot-2014.05/output/build/hello-world-1.0.0'
/home/marco/projects/bb-buildroot-2014.05/output/host/usr/bin/arm-linux-gnueabihf-gcc
-o hello hello-world.o
hello-world.o: In function `main':
hello-world.cpp:(.text+0x8): undefined reference to `std::cout'
hello-world.cpp:(.text+0xc): undefined reference to `std::cout'
hello-world.cpp:(.text+0x18): undefined reference to
`std::basic_ostream<char, std::char_traits<char> >& std::operator<<
<std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char>
>&, char const*)'
hello-world.cpp:(.text+0x24): undefined reference to
`std::basic_ostream<char, std::char_traits<char> >& std::endl<char,
std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char>
>&)'
hello-world.cpp:(.text+0x28): undefined reference to
`std::basic_ostream<char, std::char_traits<char> >& std::endl<char,
std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char>
>&)'
hello-world.cpp:(.text+0x2c): undefined reference to
`std::ostream::operator<<(std::ostream& (*)(std::ostream&))'
hello-world.o: In function `__static_initialization_and_destruction_0(int,
int)':
hello-world.cpp:(.text+0x74): undefined reference to
`std::ios_base::Init::Init()'
hello-world.cpp:(.text+0x80): undefined reference to
`std::ios_base::Init::~Init()'
hello-world.cpp:(.text+0x84): undefined reference to
`std::ios_base::Init::~Init()'
collect2: error: ld returned 1 exit status
make[1]: *** [hello] Error 1
make[1]: Leaving directory
`/mnt/ocz-vector/projects/bb-buildroot-2014.05/output/build/hello-world-1.0.0'
make: ***
[/home/marco/projects/bb-buildroot-2014.05/output/build/hello-world-1.0.0/.stamp_built]
Error 2
marco@xeon:~/projects/bb-buildroot-2014.05$

Can anyone help me?
Thank you so much!

Best regards,
Marco.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140804/ae34121d/attachment.html>
