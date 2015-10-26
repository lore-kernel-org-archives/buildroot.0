From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 26 Oct 2015 16:24:45 -0500
Subject: [Buildroot] [git commit] package/initscripts: S40network: wait
 for network interfaces to appear
In-Reply-To: <20151026210447.GC3788@free.fr>
References: <20151016111136.50FA381F8A@busybox.osuosl.org>
 <CAMQcK5K7pKFBoN9N2hv4oLscew6qTWvj9RhfiCviLako0VzdRg@mail.gmail.com>
 <87io5tcraw.fsf@dell.be.48ers.dk>
 <CADZ9A7pN8Tq8NzDbnNDjjSP0Y7Edvo7TbngcFNhttO+v+ybMXg@mail.gmail.com>
 <20151026210447.GC3788@free.fr>
Message-ID: <CAMQcK5+CrTFbDBKFq4ACQ=Ea2OCtZ9vYvnfLOmO8cQf9qhbbKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Peter,

On Mon, Oct 26, 2015 at 4:04 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Maury, Ryan, Peter, All,
>
> On 2015-10-26 15:53 -0500, Maury Anderson spake thusly:
>> I believe both suggestions should be added.
>>
>> Thank you for the awk magic.  The modified awk magic creates duplicates,
>> for instance if you had "lo eth3 eth3:1 eth3:2" you end up with "lo eth3
>> eth3 eth3".  The duplicates don't hurt anything, just waste time in the
>> loop.  Can we pipe it through uniq?  (Provided uniq is in the default
>> busybox.)
>
> Or still in awk:
>
>     ifaces=$(awk '/^auto/ { split($2, iface, ":"); ifaces[iface[1]]=1; }
>                   END { for(i in ifaces) { printf( "%s\n", i); } }
>                  ' \
>                  /etc/network/interfaces
>             )

For what my two USD cents is worth:  ;)

I prefer just keeping Peter's awk suggestion of:

awk '/^auto/ { split($2, iface, ":"); print iface[1] }' /etc/network/interfaces

The reason I prefer this is because of the simplicity of it and it is
much easier to read and understand for people who are causal users of
AWK syntax (such as myself). As Peter said, I think overhead of the
simplified command is worth it over the complication of this awk
command above.

A patch should be inbound to the mailing list shortly addressing this issue.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
