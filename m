From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 10 Jun 2011 13:49:31 -0500
Subject: [Buildroot] Generic serial port disappear after udev started
In-Reply-To: <BANLkTinE9E==rnL=NJSKkW=SELY=bZbHJg@mail.gmail.com>
References: <BANLkTinE9E==rnL=NJSKkW=SELY=bZbHJg@mail.gmail.com>
Message-ID: <201106101349.34083.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri June 10 2011, Dwi Sasongko Supriyadi wrote:
> Hello List,
> 
> Normally i put getty on serial port which is /dev/ttySAC0 and so far there
> is no issue with it, but after udev installed and started, the system
> complains that it can not find /dev/ttySAC0.
> 
> VFS: Mounted root (nfs filesystem).
> Freeing init memory: 624K
> Populating /dev using udev: done
>

Is /dev on nfs?
that might be the problem, nfs makes files, not device nodes.

Mike
> Starting portmap: done
> Initializing random number generator... done.
> Starting system message bus: Failed to start message bus: The pid file
> "/var/run/messagebus.pid" exists, if the message bus is not running, remove
> this file
> done
> Starting network...
> ifup: interface lo already configured
> Starting sshd: /var/empty must be owned by root and not group or
> world-writable.
> OK
> /etc/init.d/dhcp-relay not yet configured! - Aborting...
> /etc/init.d/dhcp-server not yet configured! - Aborting...
> Starting HAL daemon: done
> can't open /dev/ttySAC0: No such file or directory
> can't open /dev/ttySAC0: No such file or directory
> 
> I thought that there is issue with udev rules and this could be related with
> device_table.txt, but it seems wrong. When I added following line to
> device_table.txt
> 
> /dev/ttySAC     c       666     0       0       204     64      0       1
>     4
> 
> udev rules (etc/udev/rules.d/50-udev-default.rules) does not change. Then I
> edit etc/udev/rules.d/50-udev-default.rules manually added following line:
> 
> KERNEL=="ttySAC[0-3]*",       NAME="%k", OWNER="root"  GROUP="tty",
> MODE="0660"
> 
> but still, the system complains that it can not find /dev/ttySAC0
> 
> Could anyone please point me to the right direction?
> 
> Currently I am still looking for the answer on Google as well as udev
> manual, when it solved I will post it.
> 
> Thanks in advance,
> DWI
> 
> 
> 
> --
> 
