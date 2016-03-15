From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Tue, 15 Mar 2016 16:20:35 +0100
Subject: [Buildroot] init module i2c-dev automatically
In-Reply-To: <20160315160518.174008c3@free-electrons.com>
References: <CALtfCQbnrv0MFhsLXdOd6bKJXoS18WMv=htqefB4f__5vZtmqg@mail.gmail.com>
 <20160315160518.174008c3@free-electrons.com>
Message-ID: <CALtfCQYQATC3ayurUZP3pf2x8YR4W6_=TEdnrr8vrDHA0_4atw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK,

For example a /etc/init.d/S18loadmod script like this:
---
#!/bin/sh
#
# load modules
#

MODULES_PATH="/etc/modules"

case "$1" in
start)
echo "Loading modules in ${MODULES_PATH}..."
for line in $(cat ${MODULES_PATH});
do
[[ $line = \#* ]] && continue
modprobe $line;
done
;;
stop)
;;
restart|reload)
;;
*)
echo "Usage: $0 {start|stop|restart}"
exit 1
esac

exit $?
---

Oscar Gomez Fuente

On 15 March 2016 at 16:05, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 15 Mar 2016 15:54:54 +0100, ?scar G?mez Fuente wrote:
>
> > I'm using buildroot with Init System  busybox and /dev management:
> Dynamic
> > using devtmpfs + eudev.
> >
> > How can I load the i2c-dev module automatically in the init?
> >
> > I'm trying to create the file /etc/modules with the line i2c-dev, but it
> > doesn't work.
>
> You need to create an init script that loads your module, or
> alternatively reads /etc/modules and loads the modules listed in this
> file. We don't have a mechanism that automatically loads such modules
> (real device drivers are loaded automatically by udev, but i2c-dev is
> kind of a special case).
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160315/d31642c3/attachment.html>
