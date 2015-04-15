From: Nimai Mahajan <nimaim@gmail.com>
Date: Wed, 15 Apr 2015 08:11:33 -0400
Subject: [Buildroot] How to allocate 100% of memory to /tmp?
In-Reply-To: <CAOS_Y6QdG3nJAvzT_BggE-uG7-qDHorFk7OoT1-632mLbBbVAw@mail.gmail.com>
References: <CALoSW658=RKf+o=X4ND03U5CiH83poVTPrU+uGDAJPkKtXzUHw@mail.gmail.com>
 <CAOS_Y6QdG3nJAvzT_BggE-uG7-qDHorFk7OoT1-632mLbBbVAw@mail.gmail.com>
Message-ID: <CALoSW67QkhJHyghRhzKqtQYiw7i=hBafLeBUw2hB3_X79rW1SQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 14, 2015 at 8:06 PM, Rob Landley <rob@landley.net> wrote:
> On Tue, Apr 14, 2015 at 6:28 PM, Nimai Mahajan <nimaim@gmail.com> wrote:
>> We are working on a recovery system using Buildroot that operates
>> solely in memory. Some data we send over is 1-2GB in size so we'd like
>> to allocate all of the memory to /tmp.
>
> mount -o remount,size=80% /tmp
>
> (And if you do that, don't be surprised if your system locks solid.
> The oom killer can't evict page cache. In theory tmpfs can evict it to
> swap, but when swap fills up the oom killer will get _really_confused_
> if the amount of memory dedicated to unfreeable disk cache is
> disproportionately high leaving it with no good choices on what to
> do.)
>
>> I'm not sure where the setting
>> is to change this but on a system with 2 GB of memory for example,
>> /tmp is given 1 GB and /dev/shm the other 1 GB. How do I map this
>> differently in a safe manner?
>
> You don't do 100% in a safe manner, that leaves nothing for the rest
> of the system.
>
>> Or is this normal behavior? Thanks!
>
> The tmpfs default is 50%, yes. The size= argument changes that
> default, I normally use percent but you can specify megabytes and such
> instead. According to
> http://kernel.org/doc/Documentation/filesystems/tmpfs.txt you can even
> specify size=0 to take the guiderails off completely and lock your
> system solid as soon as you write enough data to /tmp, just like ramfs
> would.
>
> Up to you, really. As with all open source, if it breaks, you get to
> keep the pieces. Try it and see what happens, maybe a big enough swap
> partition will make it work anyway, I haven't played with this bit
> much.
>
> Rob

Makes sense, thanks Rob! This helps a lot, I didn't know 50% is tmpfs
default, that is good to know. I will consider using a storage
partition then and avoiding potential pitfalls with this.
