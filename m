From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 11:27:24 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] boost: context needs thread if gcc <= 4.6
In-Reply-To: <20180820221257.1553-1-fontaine.fabrice@gmail.com>
References: <20180820221257.1553-1-fontaine.fabrice@gmail.com>
Message-ID: <20180821112724.3835f7ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 00:12:56 +0200, Fabrice Fontaine wrote:
> mutex is available on gcc 4.7.x, the issue is that boost does not
> correctly detect it because -std=c++11 is missing.

Where did you get the information that mutex is available since gcc
4.7 ? Is it by testing gcc 4.6 and 4.7 ?

I couldn't get this information by looking at
https://gcc.gnu.org/projects/cxx-status.html#cxx11.

Also, I am wondering if the two patches should really be separate.
Aren't they in fact both intimately related, where std::mutex will only
be visible in gcc >= 4.7 if std=c++11 is passed ?

To me, they are basically one single patch:

 - Below gcc 4.7, we don't have std::mutex, so boost-thread must be used
 - Above gcc 4.7, we have std::mutex, but we need to pass std=c++11 for
   std::mutex to be visible/usable

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
