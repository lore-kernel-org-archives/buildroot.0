From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 23:31:50 +0200
Subject: [Buildroot] [PATCH 1/3] package/boost: disable boost-log with
 bfin uClibc 2014R1 toolchain
In-Reply-To: <1428611020-9329-1-git-send-email-romain.naour@openwide.fr>
References: <1428611020-9329-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150409233150.03226fb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu,  9 Apr 2015 22:23:38 +0200, Romain Naour wrote:
> pthread_spin_* functions are not implemented in the uClibc used by this toolchain.
> 
> In file included from libs/log/src/threadsafe_queue.cpp:33:
> ./boost/log/detail/spin_mutex.hpp: In constructor ?boost::log::v2_mt_posix::aux::spin_mutex::spin_mutex()?:
> ./boost/log/detail/spin_mutex.hpp:198: error: ?pthread_spin_init? was not declared in this scope
> ./boost/log/detail/spin_mutex.hpp: In destructor ?boost::log::v2_mt_posix::aux::spin_mutex::~spin_mutex()?:
> ./boost/log/detail/spin_mutex.hpp:205: error: ?pthread_spin_destroy? was not declared in this scope
> ./boost/log/detail/spin_mutex.hpp: In member function ?bool boost::log::v2_mt_posix::aux::spin_mutex::try_lock()?:
> ./boost/log/detail/spin_mutex.hpp:210: error: ?pthread_spin_trylock? was not declared in this scope
> ./boost/log/detail/spin_mutex.hpp: In member function ?void boost::log::v2_mt_posix::aux::spin_mutex::lock()?:
> ./boost/log/detail/spin_mutex.hpp:220: error: ?pthread_spin_lock? was not declared in this scope
> ./boost/log/detail/spin_mutex.hpp: In member function ?void boost::log::v2_mt_posix::aux::spin_mutex::unlock()?:
> ./boost/log/detail/spin_mutex.hpp:227: error: ?pthread_spin_unlock? was not declared in this scope

I believe a better option is probably to make this option depend on
BR2_TOOLCHAIN_HAS_THREADS_NPTL. pthread_spin_* are available in
linuxthreads, but not linuxthreads.old apparently, linuxthreads is very
rarely used. So I believe limiting to NPTL thread implementation is a
good enough approximation.

Also, it's probably a bit heavy to do one patch per toolchain version.

>  config BR2_PACKAGE_BOOST_LOG
> -        bool "boost-log"
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # missing pthread_spin_* in uClibc.
> +	bool "boost-log"

I've fixed up the indentation as a separate commit. The 'depends on'
line should be after the 'bool' line.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
