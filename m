From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 14 Jan 2014 09:47:05 -0500
Subject: [Buildroot] Problem with multi interface support in udhcpc script?
Message-ID: <CANxTyt44suVoSpVTivmKde77P7fUYRa04a_fQfb=ceA-Yym9sQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Back in June 2013, you committed this change to add support for
multiple neetwork interfaces in resolv.conf:

http://git.buildroot.net/buildroot/commit/package/busybox/udhcpc.script?id=584f418ec1ae3f0b5e09c10133c82578d78a3e03

However, I don't think that this quite works.  The "nameserver" lines
are okay, because it's supposed to be one server per line.  But there
is supposed to be only one "search" line.  So, for example, if I use
the resolv library to dump resolv.conf data, I only get the search
domains from the *last* search line.   Similarly, when I try to
resolve a name, the search domain ommitted by the reolve library info
appears to not be used by busybox's "nslookup" app.

FYI, the program that used to dump resolv.conf info is below.

I'm wondering if there needs to be comment lines to track the search
domains per interface, and then a fancy grep+sed bit to synthesize a
single aggregate search line from those comments.

When you did the original change, do you recall if you tested if the
multiple search lines let you resolve non-FQDN refs correctly?

Danomi -


// gcc -Wall res_dump.c -o res_dump -lresolv
#include <stdio.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <arpa/nameser.h>
#include <arpa/inet.h>
#include <resolv.h>

int main(int argc, char *argv[])
{
    char net_data[256];
    int ii;

    if (res_init() != 0) return EXIT_FAILURE;

    printf("search");
    for (ii=0; ii<MAXDNSRCH; ii++)
        if (_res.dnsrch[ii] != NULL)
            printf(" %s", _res.dnsrch[ii]);
    printf("\n");

    for (ii=0; ii<_res.nscount; ii++)
    {
        const struct sockaddr_in *dns_addr = &_res.nsaddr_list[ii];
        if (dns_addr != NULL)
            if (dns_addr->sin_family == AF_INET)
                if (inet_ntop(AF_INET, &dns_addr->sin_addr, net_data,
sizeof(net_data)) != NULL)
                    printf("nameserver %s\n", net_data);
    }

    return EXIT_SUCCESS;
}
