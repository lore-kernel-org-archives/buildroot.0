From: Dominik Menke <dom@digineo.de>
Date: Tue, 30 Apr 2019 12:23:23 +0200
Subject: [Buildroot] Possible conflict with systemd and e2fsprogs?
In-Reply-To: <6824ef05-10eb-d45a-4dd7-0fc75173473e@mind.be>
References: <4dcaadcb-0ef8-887e-6681-1f326194315c@digineo.de>
 <7bb7a201-cdd2-7e66-deee-6175a264366c@mind.be>
 <1780e90c-9198-e9b6-5b38-9b27930337e2@digineo.de>
 <4e0cc833-814c-3cc6-deb3-6539a0f92f4f@mind.be>
 <b3efb298-2353-ce88-552b-34fbe26df110@digineo.de>
 <df9e7287-f9b0-4381-6a04-3424ee752065@digineo.de>
 <6824ef05-10eb-d45a-4dd7-0fc75173473e@mind.be>
Message-ID: <6f2db71a-82fe-4995-878b-3783b7bc5d42@digineo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4/29/19 10:37 PM, Arnout Vandecappelle wrote:
> On 29/04/2019 18:18, Dominik Menke wrote:
>> [??? 4.547439] systemd-fsck[94]: /dev/mmcblk0p2: Superblock last write time (Mon
>> Apr 29 17:37:11 2019,
>> [??? 4.551637] systemd-fsck[94]:???? now = Thu Feb 14 11:11:59 2019) is in the
>> future.
> 
>   My systemd-fu is not great, but it looks weird that now = somewhere in 2019 if
> you have no RTC. I believe fsck has code to ignore the time-in-future check if
> now ~ 1970.

The "now" date coincides with the commit date of 
https://github.com/systemd/systemd/commit/e62a7fea757f259eb330da5b6d3ab4ede46400a2. 
 From what I can gather, systemd-timesyncd claims to be responsible for 
setting the initial boot time. systemd-timesyncd.service(8) reads:

> /var/lib/systemd/timesync/clock
>     
> The modification time of this file indicates the timestamp of the
> last successful synchronization (or at least the systemd build date,
> in case synchronization was not possible).

However, after disabling systemd-timesyncd (in menuconfig) and a clean 
build, the date persists...

I'm now considering to permanently add fsck.mode=skip to the kernel 
command line. That'll restore the default behaviour for BR2 systems with 
systemd enabled and ext4 partitions (util-linux' fsck does not provide 
support for those).

My short term goal is to get to an A/B booting scheme anyway. I can then 
trigger fsck manually on the running system for the *other* root fs, 
instead of the *current* root fs.

I'm aware this is a "works for me" solution.

Again, thanks for your time and input!
Dominik
