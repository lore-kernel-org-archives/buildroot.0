From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Sep 2018 11:45:12 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-08-30
In-Reply-To: <CANQCQpbSwyZXQZyOgG2-kcPFS0HcJENhzZWg9oCjaDRx5FWwYA@mail.gmail.com>
References: <20180831060016.342FF22A3A@mail.bootlin.com>
 <241764101.4041403.1535918222698.JavaMail.zimbra@datacom.com.br>
 <CANQCQpZxci70YBUJAfJ12RTjDtPBeD8M-3H4b_6EVMUe+oB9jQ@mail.gmail.com>
 <CANQCQpbSwyZXQZyOgG2-kcPFS0HcJENhzZWg9oCjaDRx5FWwYA@mail.gmail.com>
Message-ID: <20180904114512.153df013@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Sep 2018 14:49:24 -0500, Matthew Weber wrote:

> Figured it out, the python3 bump and the addition of the python uuid
> dependency on util-linux, created a circular dependency making
> libselinux and util-linux build out of order.
> (6e7e733f3bb)

So, if I get it right, the circular dependency is:

 util-linux -> libselinux -> python3 -> util-linux

But wait, I realize that there is worse, with the Python libuuid thing,
we have the following circular dependency as well:

 util-linux -> python3 -> util-linux

So that last one we can fix by introducing python-util-linux, as I was
suggesting to also solve the BlueZ related circular:

  http://lists.busybox.net/pipermail/buildroot/2018-August/229558.html

But that first one is different, because it won't be solved by moving
the util-linux Python bindings to a separate package. To solve:

 util-linux -> libselinux -> python3 -> util-linux

then we need to create python-libselinux, which will build/install the
python bindings of libselinux. This way util-linux -> libselinux will
not pull in a python3 dependency. This should be doable, because
libselinux has separate make targets for building/installing the python
bindings.

These circular dependencies are annoying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
