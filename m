From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Tue, 4 Sep 2018 12:58:49 +0200
Subject: [Buildroot] Problmes with eth0 on Raspberry Pi 3B+
Message-ID: <CALtfCQYbuFj8HMLNpk4t=M4FeZF4_=wXjNw7YcQPcN=iGYsR7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I am using the last Buildroot version from GIT:
2989e3c87a1123350728904fd789ad513e76b073 and I've noticed that
buildroot init as fast that it seems to be the eth0 device it isn't
ready yet. Afert it inits if I execute: ifup eth0, it works fine. The
same method with the raspberry Pi 3B works fine.

I know you can configure the /etc/network/interfaces with a command to
wait, and I did:
...
auto eth0
iface eth0 inet manual
       wait-delay 10
        pre-up ifconfig eth0 up
        pre-up /sbin/udhcpc -R -b -p /var/run/udhcpc.eth0.pid -i eth0
        pre-up /etc/network/nfs_check
        post-down kill -9 $(cat /var/run/udhcpc.eth0.pid)
        post-down ifconfig eth0 down
..

But it doesn't work. So I decided to place a sleep manually:
...
auto eth0
iface eth0 inet manual
        pre-up while [ ! -e /sys/class/net/eth0 ]; do sleep 0.1; done;
        pre-up ifconfig eth0 up
        pre-up /sbin/udhcpc -R -b -p /var/run/udhcpc.eth0.pid -i eth0
        pre-up /etc/network/nfs_check
        post-down kill -9 $(cat /var/run/udhcpc.eth0.pid)
        post-down ifconfig eth0 down

And this method works fine, but I think it isn't the proper way to do
it So my conclusion is the command wait-delay isn't work properly.

Could there be a bug in the script /etc/network/if-pre-up.d/wait_iface?

Best regards.

Oscar Gomez Fuente.
