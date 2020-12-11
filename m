From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 13:42:23 +0100
Subject: [Buildroot] [PATCH v1] package/thermald: fix time_t related
 compile failure
In-Reply-To: <20201123211248.23828-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 23 Nov 2020 22:12:48 +0100")
References: <20201123211248.23828-1-ps.report@gmx.net>
Message-ID: <87tussqztc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add upstream patch [1] to fix (musl) time_t related compile failure.
 > Fixes:

 >   - https://bugs.busybox.net/show_bug.cgi?id=13336

 >   src/thd_trip_point.cpp: In member function ?bool cthd_trip_point::thd_trip_point_check(int, unsigned int, int, bool*)?:
 >   src/thd_trip_point.cpp:250:19: error: format ?%ld? expects argument of type ?long int?, but argument 6 has type ?time_t? {aka ?long long int?} [-Werror=format=]
 >     250 |      thd_log_info("Too early to act zone:%d index %d tm %ld\n",
 >         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >     251 |        zone_id, cdev->thd_cdev_get_index(),
 >     252 |        tm - cdevs[i].last_op_time);
 >         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~
 >         |           |
 >         |           time_t {aka long long int}
 >   src/thermald.h:82:57: note: in definition of macro ?thd_log_info?
 >      82 | #define thd_log_info(...) g_log(NULL, G_LOG_LEVEL_INFO, __VA_ARGS__)
 >         |                                                         ^~~~~~~~~~~
 >   src/thd_trip_point.cpp:250:59: note: format string is defined here
 >     250 |      thd_log_info("Too early to act zone:%d index %d tm %ld\n",
 >         |                                                         ~~^
 >         |                                                           |
 >         |                                                           long int
 >         |                                                         %lld

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
