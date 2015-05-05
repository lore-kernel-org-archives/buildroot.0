From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 05 May 2015 23:18:51 +0200
Subject: [Buildroot] integrating MariaDB Galera Cluster into BR
In-Reply-To: <55489BE5.6070402@green-communications.fr>
References: <553A5805.3080701@green-communications.fr>	<20150424175438.GG4244@free.fr>
 <55489BE5.6070402@green-communications.fr>
Message-ID: <554933BB.80404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/05/15 12:31, Sylvain Raybaud wrote:
> On 24/04/2015 19:54, Yann E. MORIN wrote:
>> On 2015-04-24 16:49 +0200, Sylvain Raybaud spake thusly:
> 
>>> a) Create a meta-package, for example "mysql compatible DB", the 
>>> selection of which would let the user choose between MariaDB
>>> Galera Cluster or MySQL?
>>>
>>> b) Integrate MariaDB Galera Cluster into MySQL package and let
>>> the user choose which implementation he wants?
>>>
>>> c) Make these packages mutually exclusive using "depends on !"?
> 
>> I would say either b) or c). Which one depends on how MariaDB
>> Galera is seen with respect to MySQL:
> 
>> 1- is it a completely different implementation that is 100%
>> compatible?
> 
>> 2- is it a fork that is 100% compatible?
> 
>> 3- is it a fork that is not 100% compatible?
> 
>> For 1 or 2, I'd say go with b), otherwise go for c).
> 
> MariaDB is supposed to be a "drop-in replacement for MySQL" so I
> suppose I should go for b).
> https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-compatibility/
> lists some differences but it seems that everything you can do with
> MySQL you can do with MariaDB.
> 
> Does option b) allow dependencies specific to MariaDB?

 It's very easy to add something like this to mysql.mk:

ifeq ($(BR2_PACKAGE_MYSQL_MARIADB),y)
MYSQL_DEPENDENCIES += foo
else
MYSQL_DEPENDENCIES += bar
endif


 And so on for all other things that are different between the two builds. Even
if they were completely different, you could put a big ifeq around the entire
.mk file.

 You'll have more trouble with the patches. The only solution for those is to
move them to a version-specific directory, so 5.1/ for the mysql version and
10.0.17 for MariaDB.


 Regards,
 Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150505/2d023c98/attachment.asc>
