From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2015 19:54:38 +0200
Subject: [Buildroot] integrating MariaDB Galera Cluster into BR
In-Reply-To: <553A5805.3080701@green-communications.fr>
References: <553A5805.3080701@green-communications.fr>
Message-ID: <20150424175438.GG4244@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sylvain, All,

On 2015-04-24 16:49 +0200, Sylvain Raybaud spake thusly:
> I would like to integrate MariaDB Galera Cluster
> (https://mariadb.com/kb/en/mariadb/what-is-mariadb-galera-cluster/)
> into Buildroot. Before I prepare and submit patches I would like to
> ask a few questions about how to do things properly: MariaDB conflicts
> with MySQL (they install the same files). Should I:
> 
>  a) Create a meta-package, for example "mysql compatible DB", the
> selection of which would let the user choose between MariaDB Galera
> Cluster or MySQL?
> 
>  b) Integrate MariaDB Galera Cluster into MySQL package and let the
> user choose which implementation he wants?
> 
>  c) Make these packages mutually exclusive using "depends on !"?

I would say either b) or c). Which one depends on how MariaDB Galera is
seen with respect to MySQL:

 1- is it a completely different implementation that is 100% compatible?

 2- is it a fork that is 100% compatible?

 3- is it a fork that is not 100% compatible?

For 1 or 2, I'd say go with b), otherwise go for c).

If you decide for c), then only one can depend on not the ther
(otherwise you'd have a crcular dependency). That is, something like:

    config BR2_PKG_MYSQL
        bool "mysql"

    config BR2_PKG_MARIADB
        bool "mariadb"
        depends on !BR2_PKG_MYSQL

Anyway, if you're not sure, go for c); we will review the patch, and we
can guide you based on the details.

in any case, be sure to read:

  - the section(s) from the "Adding new packages to Buildroot" chapter,
    that applies to mariadb (e.g. generic, autotools, cmake...):
    http://buildroot.net/downloads/manual/manual.html#adding-packages

  - the section on how to send patches:
    http://buildroot.net/downloads/manual/manual.html#submitting-patches

Happy hacking! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
