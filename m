From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 9 Feb 2018 07:54:29 -0500
Subject: [Buildroot] [PATCH 1/1] dbus: fix system_bus_socket location
In-Reply-To: <62609522-18ba-40d6-847a-8feb00890602@cesnet.cz>
References: <20180208192324.10325-1-aduskett@gmail.com>
 <20180208193450.j4k5kj3ccdf5dk7o@tarshish>
 <CAFSsvmqDd_CrgW9VRUwfz34c28Qj5SkSWXs0pn2+bvki38cEOA@mail.gmail.com>
 <62609522-18ba-40d6-847a-8feb00890602@cesnet.cz>
Message-ID: <CAFSsvmoXr5Q89dgN0Q_dT2RxcsqKCwN=kDGTUEct2yVWwJW4GQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Jan;

I am going to reject my own patch.  After more research, it seems like
I was using a very
old setup script that removed a bunch of symlinks from /var and setup
them as actual
folders due to selinux context concerns.

Newer versions of selinux handle these symlinks fine. So in the end,
my setup was broken.

Thanks!

Adam

On Fri, Feb 9, 2018 at 7:28 AM, Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:
>> That solution won't work on a rootfs with that is read/write.  My own
>> filing
>> system doesn't have a symlink from /var/run to ./run
>>
>> Perhaps it's just me?
>
>
> Hi Adam, according to both D-Bus and systemd upstreams, having separate /run
> from /var/run is broken. New enough systemd also warns against that.
>
> Just changing the D-Bus socket location won't work. My patch links a
> bugreport where people have mentioned that the /var/run/dbus essentially
> cannot change because it's hard-coded in other SW as well.
>
> Can you investigate which part creates /run and /var/run on your
> configuration of buildroot, but with a fresh-from-scratch build? Grepping
> for "/run" in build/packages-file-list.txt should answer that.
>
> Cheers,
> Jan
