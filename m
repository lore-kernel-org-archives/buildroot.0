From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Nov 2014 20:41:40 -0300
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20141111234919.3178e9d3@free-electrons.com>
References: <20141111073014.AA83D101626@stock.ovh.net>
 <20141111234919.3178e9d3@free-electrons.com>
Message-ID: <54629EB4.5040203@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/2014 07:49 PM, Thomas Petazzoni wrote:

>>         bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/4d0c3c8b68b37f532378f19041379cb5c5798950/
> 
> in_netlink.c:40:29: error: netlink/netlink.h: No such file or directory
> in_netlink.c:41:27: error: netlink/cache.h: No such file or directory
> in_netlink.c:42:27: error: netlink/utils.h: No such file or directory
> in_netlink.c:43:32: error: netlink/route/link.h: No such file or directory
> in_netlink.c:44:30: error: netlink/route/tc.h: No such file or directory
> 
> Gustavo, maybe?

I blame Maxime's bump :)
Patch ready though.

>>      powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/be3466bacf99f8796d4cb73440e40f29041d7848/
>>      powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b2140fc00e3de3ac401a49d2920bcf695f6aa184/
>>      powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b6ee496683e91d73fd55111beb0e40fc6fc90be7/
>>      powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6eadc312e621953345e6c25c89625da6e6d54868/
> 
> The kernel headers problem. We need to re-add a dependency on kernel
> headers >= 3.0 I believe. Gustavo, what do you think?

I'll say it once more and sorry for the bad language.
That toolchain is f***** up in headers-land.
We can exclude it via deps, blacklist it or get rid of it.
Since it's the headers that are busted i'd vote for option 3, it's just
a matter of time before it shows up in some other package.

>>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/afadd15313ceb5b2dbe3bcef48a9bc8a5108b061/
>>          sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/cc599de01d56177a74c5563cc0b9932754a34d55/
>>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/bd6575362a3ce97e24b65180fddbc3eae4bc10fb/
> 
> Gazillions of:
> 
> /home/buildroot/instance-0/output/build/libmemcached-1.0.18/libhashkit/rijndael.cc:1210: undefined reference to `___mf_lc_shift'
> /home/buildroot/instance-0/output/build/libmemcached-1.0.18/libhashkit/rijndael.cc:1210: undefined reference to `___mf_lc_mask'
> /home/buildroot/instance-0/output/build/libmemcached-1.0.18/libhashkit/rijndael.cc:1210: undefined reference to `___mf_lc_mask'
> /home/buildroot/instance-0/output/build/libmemcached-1.0.18/libhashkit/rijndael.cc:1210: undefined reference to `___mf_lookup_cache'
> 
> For no apparent reason: some configs above are static, but some are
> not. Gustavo, you are our libmemcached guy :-)

Incomplete external toolchain libmudflap handling, patch is easy enough
to ditch the support, but we're missing the libmudflapth copies basically.
It's been deprecated for gcc >= 4.9 though so it probably doesn't make
much sense to fix it for external toolchains (if many shipped libmudflap
we'd seen this failure a lot more).

Regards.
