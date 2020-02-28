From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Fri, 28 Feb 2020 17:17:20 +0100
Subject: [Buildroot] [PATCH 3/3] package/python-iptables: use installed
 iptables by default
In-Reply-To: <1831645.BBFHC3lhqW@wintermute>
References: <20200226142617.4170-1-frank.vanbever@essensium.com>
 <20200226163322.675b66f5@windsurf> <1831645.BBFHC3lhqW@wintermute>
Message-ID: <2358331.LJ4T0ylkKU@wintermute>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> I'll see if I can whip something up and submit it upstream.

I gave it another try but it seems that I was a bit too optimistic yesterday. 
The xtables module requires the ABI  version to cast the return values for 
matches and targets to something it can access.

I have a final last ditch theory about how this could be fixed, but to be honest 
it's really starting to look like more trouble than it's worth.

The ABI version information is embedded into struct xtables_match and 
 struct xtables_target. You should be able to get to these just from a handle 
to the libxtables.so and the location of the iptables extensions (i.e. 
xtables_libdir), for which you could use the same solution as for libc and 
test a number of sensible locations if ldconfig is unavailable.
The xtables_{match,target} structs always have the version field as the first 
field in the returned struct so I think you could do an 
xtables_find_{target,match} and do a ctypes.cast to a dummy ctypes.struct class 
with  just the version field.

The way the module is written though requires the ABI  version global variable 
to instantiate the xtables class which contains the logic that would allow you 
to find a match/target. So you get into this chicken or the egg type situation 
where you need to know the ABI version to get the workaround way to get the 
ABI version to work.


Best regards,
Frank
