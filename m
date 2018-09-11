From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Tue, 11 Sep 2018 20:21:41 +0200
Subject: [Buildroot] Problmes with eth0 on Raspberry Pi 3B+
In-Reply-To: <CALtfCQYbuFj8HMLNpk4t=M4FeZF4_=wXjNw7YcQPcN=iGYsR7Q@mail.gmail.com>
References: <CALtfCQYbuFj8HMLNpk4t=M4FeZF4_=wXjNw7YcQPcN=iGYsR7Q@mail.gmail.com>
Message-ID: <CALtfCQb2AZWq4FAeDqyuQse6XVjs-Qp3zzEUNAPOBw13_k06rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,


I've got problems with the buildroot email and I didn't receive any
message, but I could see the answers in this link:
http://lists.busybox.net/pipermail/buildroot/2018-September/229775.html
so I'm going to try to answer again in order to get some support and
check if the buildroot list emails works.

Hi Nicollas, it seems to be that pre-up before wait-delay it doesn't
work, and it seems to be that wait-delay only works if you select inet
dhcp, so I have to find an alternative method to wait-delay or create
a new script for me. The way I'm using right now it is not too bad:
...
pre-up while [ ! -e /sys/class/net/eth0 ]; do sleep 0.1; done;
...
And according to :"ifconfig is a bid deprecated these days", yes you
are right, I am going to use something like:
...
pre-up ip link set dev eth0 up
...

Hi Peter,  I am using this way because when I connect and disconnect
the ethernet cable it doesn't work dhcp and the eth0 don't get the ip
properly.


Best regards.





Oscar Gomez Fuente

On Tue, 4 Sep 2018 at 12:58, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:
>
> Hi everyone,
>
> I am using the last Buildroot version from GIT:
> 2989e3c87a1123350728904fd789ad513e76b073 and I've noticed that
> buildroot init as fast that it seems to be the eth0 device it isn't
> ready yet. Afert it inits if I execute: ifup eth0, it works fine. The
> same method with the raspberry Pi 3B works fine.
>
> I know you can configure the /etc/network/interfaces with a command to
> wait, and I did:
> ...
> auto eth0
> iface eth0 inet manual
>        wait-delay 10
>         pre-up ifconfig eth0 up
>         pre-up /sbin/udhcpc -R -b -p /var/run/udhcpc.eth0.pid -i eth0
>         pre-up /etc/network/nfs_check
>         post-down kill -9 $(cat /var/run/udhcpc.eth0.pid)
>         post-down ifconfig eth0 down
> ..
>
> But it doesn't work. So I decided to place a sleep manually:
> ...
> auto eth0
> iface eth0 inet manual
>         pre-up while [ ! -e /sys/class/net/eth0 ]; do sleep 0.1; done;
>         pre-up ifconfig eth0 up
>         pre-up /sbin/udhcpc -R -b -p /var/run/udhcpc.eth0.pid -i eth0
>         pre-up /etc/network/nfs_check
>         post-down kill -9 $(cat /var/run/udhcpc.eth0.pid)
>         post-down ifconfig eth0 down
>
> And this method works fine, but I think it isn't the proper way to do
> it So my conclusion is the command wait-delay isn't work properly.
>
> Could there be a bug in the script /etc/network/if-pre-up.d/wait_iface?
>
> Best regards.
>
> Oscar Gomez Fuente.
