From: Frederick Gotham <cauldwell.thomas@gmail.com>
Date: Fri, 22 Nov 2019 08:00:48 -0000 (UTC)
Subject: [Buildroot] Where the cross-compiler gets shared stuff
Message-ID: <XnsAB0F51847D9ABfgotham@195.159.176.226>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Typically, when a cross-compiler is installed properly on a computer, do you 
need to explicitly invoke it with "--sysroot=/opt/targetfs", or is this 
parameter already implied if the cross-compiler is properly installed? 

Right now I'm working on an embedded Linux project, and I'm using Buildroot 
to produce a minimalistic Linux installation with only the programs and 
libraries I need. 

I see that some 3rd party packages invoke the correct cross-compiler but they 
don't give the "--sysroot" parameter. 

For example, if we start off with the following native compilation command:

    gcc main.c -o prog 

Then a correct cross-compilation would be: 

    CC = /opt/project/build/output/host/bin/x86_64-buildroot-linux-gnu-gcc 
    SYSROOT = /opt/project/build/output/host/x86_64-buildroot-linux-
gnu/sysroot 

    $(CC) --sysroot=$(SYSROOT) main.c -o prog 

I see however that some packages are leaving out the sysroot parameter, and 
so they're just doing: 

    $(CC) main.c -o prog 

This predictably fails if the host and the target have different CPU's, for 
example if my office PC is x86_64 and my target is embedded Linux ARM 
aarch64. 

On my current project though, the host and the target have the same CPU, and 
so if you leave out the "--sysroot" parameter then the program ends up 
linking with shared libraries installed on the host. Sometimes this happens 
without any compiler warning or error! 

So how are cross-compilers supposed to work? If they are installed properly, 
do you need to give them the "--sysroot" parameter?

Note that I'm prefering the use of "--sysroot" instead of using the following 
two options: -I$(STAGING_DIR)/usr/include -L$(STAGING_DIR)/usr/lib.
