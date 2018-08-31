From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 00:10:01 +0200
Subject: [Buildroot] socket.AF_BLUETOOTH in python3 and circular
 dependencies
In-Reply-To: <e1bda375-e70b-94aa-5e90-c96a48217e87@blach.pl>
References: <e1bda375-e70b-94aa-5e90-c96a48217e87@blach.pl>
Message-ID: <20180901001001.60b1762c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Aug 2018 21:21:23 +0200, Grzegorz Blach wrote:

> But unfortunately this patch makes a circular dependencies:
> 
> $ make python3-graph-depends
> Recursion detected for  : bluez5_utils
> which is a dependency of: python3
> which is a dependency of: util-linux
> which is a dependency of: libglib2
> which is a dependency of: bluez5_utils

[...]

> Can someone point me how to fix circular dependencies without disabling 
> python support in util-linux?

Arghh, this is annoying :-/

I don't see a good solution here. Possible options that I see at this
point:

 (1) Change Python in Modules/socketmodule.c to not require
     bluetooth.h. It doesn't seem to link with any Bluetooth library,
     only to need bluetooth.h, so perhaps just like they do for
     FreeBSD/NetBSD, we could add the necessary definitions directly in
     socketmodule.c to avoid the bluetooth.h dependency ?

 (2) Create a python-util-linux package that would be responsible for
     building the util-linux Python bindings. This would remove Python
     from being a dependency of util-linux, and break the circular
     dependency.

     However, it is not clear that it will be easy to tell
     python-util-linux to *only* build the Python bindings and use the
     existing libraries built by the util-linux package, rather than
     rebuilding them again.

 (3) Add an explicit Config.in option for util-linux Python support,
     and make it conflict with Bluetooth support in Python.

For the record, OpenEmbedded doesn't support Bluetooth in Python socket
module, they pass:

  ac_cv_header_bluetooth_bluetooth_h=no ac_cv_header_bluetooth_h=no

to the Python configure script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
