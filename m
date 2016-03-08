From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Mar 2016 09:23:56 +0100
Subject: [Buildroot] node.js ENOTFOUND error when using uclibc
In-Reply-To: <87d1r654aa.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 07 Mar 2016 23:09:17 +0100")
References: <trinity-42794f72-6f90-430b-8cdf-048645cbdab2-1457338189594@3capp-gmx-bs39>
 <CAFGQKxcn_nCR+jGABopOAHMt0-rhAF=g3ZvaxtFaE-CzAQo1Gw@mail.gmail.com>
 <87d1r654aa.fsf@dell.be.48ers.dk>
Message-ID: <878u1t5qeb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 > Waldemar, while the application shouldn't be passing AF_UNSPEC +
 > AI_V4MAPPED it would be good if uClibc-ng could be changed to behave
 > more similar to glibc for compatibility reasons.

FYI, there's a glibc bug about this:

https://sourceware.org/bugzilla/show_bug.cgi?id=14415

It seems like something like this would fix it for uclibc-ng:

diff --git a/libc/inet/getaddrinfo.c b/libc/inet/getaddrinfo.c
index 090d7e9..7ae32be 100644
--- a/libc/inet/getaddrinfo.c
+++ b/libc/inet/getaddrinfo.c
@@ -404,8 +404,7 @@ gaih_inet(const char *name, const struct gaih_service *service,
        struct gaih_servtuple *st;
        struct gaih_addrtuple *at;
        int rc;
-       int v4mapped = (req->ai_family == PF_UNSPEC || req->ai_family == PF_INET6)
-                       && (req->ai_flags & AI_V4MAPPED);
+       int v4mapped = req->ai_family == PF_INET6 && (req->ai_flags & AI_V4MAPPED);
        unsigned seen = 0;
        if (req->ai_flags & AI_ADDRCONFIG) {
                /* "seen" is only used when AI_ADDRCONFIG is specified.

-- 
Bye, Peter Korsgaard
