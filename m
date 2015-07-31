From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 31 Jul 2015 15:22:38 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/eudev: fix build with musl +
 libselinux
In-Reply-To: <20150730225905.5572cb98@free-electrons.com>
References: <1438272098-28557-1-git-send-email-romain.naour@openwide.fr>
 <1438272098-28557-2-git-send-email-romain.naour@openwide.fr>
 <20150730225905.5572cb98@free-electrons.com>
Message-ID: <55BB769E.1040808@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 30/07/2015 22:59, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Thu, 30 Jul 2015 18:01:38 +0200, Romain Naour wrote:
> 
>> + #ifdef HAVE_SELINUX
>> ++#ifdef HAVE_MALLINFO
>> +         usec_t before_timestamp, after_timestamp;
> 
> Why do you enclose the timestamp stuff inside HAVE_MALLINFO ? It is
> unrelated.

That's because I enclosed the "else" content containing the full log_debug()
inside HAVE_MALLINFO...

Ok, I'll resend this one.

Best regards,
Romain

> 
>> +         struct mallinfo before_mallinfo, after_mallinfo;
>> ++#endif
>> + 
>> +         if (!mac_selinux_use())
>> +                 return 0;
>> +@@ -75,8 +77,10 @@ int mac_selinux_init(const char *prefix) {
>> +         if (label_hnd)
>> +                 return 0;
>> + 
>> ++#ifdef HAVE_MALLINFO
>> +         before_mallinfo = mallinfo();
>> +         before_timestamp = now(CLOCK_MONOTONIC);
> 
> Ditto.
> 
>> ++#endif
>> + 
>> +         if (prefix) {
>> +                 struct selinux_opt options[] = {
>> +@@ -91,6 +95,7 @@ int mac_selinux_init(const char *prefix) {
>> +                 log_enforcing("Failed to initialize SELinux context: %m");
>> +                 r = security_getenforce() == 1 ? -errno : 0;
>> +         } else  {
>> ++#ifdef HAVE_MALLINFO
>> +                 char timespan[FORMAT_TIMESPAN_MAX];
>> +                 int l;
>> + 
>> +@@ -102,6 +107,9 @@ int mac_selinux_init(const char *prefix) {
>> +                 log_debug("Successfully loaded SELinux database in %s, size on heap is %iK.",
>> +                           format_timespan(timespan, sizeof(timespan), after_timestamp - before_timestamp, 0),
>> +                           (l+1023)/1024);
>> ++#else
>> ++                log_debug("Successfully loaded SELinux database");
> 
> Ditto.
> 
> Thomas
> 
