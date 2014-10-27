From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 23:07:24 +0100
Subject: [Buildroot] [PATCH] schifra: fix build of examples
In-Reply-To: <1414446515-18578-1-git-send-email-arnout@mind.be>
References: <1414446515-18578-1-git-send-email-arnout@mind.be>
Message-ID: <20141027230724.009b50d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Mon, 27 Oct 2014 22:48:35 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> This has been in buildroot for more than two years and it cannot ever
> have succeeded... How come the autobuilders didn't pick this up?

That is indeed weird, because the autobuilders did pick this up... but
it didn't fail. I did a quick lookup in just the last 1000 results of
the autobuilders for those results that were successful *and* had
BR2_PACKAGE_SCHIFRA_EXAMPLES=y. And there are quite a few results:

select results.status, results.builddate, results.submitter, results.identifier, results.arch, results.reason, results_config.name, results_config.value from (select * from results order by builddate desc limit 1000) as results join results_config on results.id=results_config.resultid where results_config.name='BR2_PACKAGE_SCHIFRA_EXAMPLES' and results_config.value='y' and results.status=0;

+--------+---------------------+---------------------------+------------------------------------------+---------+--------+------------------------------+-------+
| status | builddate           | submitter                 | identifier                               | arch    | reason | name                         | value |
+--------+---------------------+---------------------------+------------------------------------------+---------+--------+------------------------------+-------+
|      0 | 2014-10-27 03:06:28 | Peter Korsgaard (gcc16)   | 41d669e7f4a403652315c2141bc2a1bf766539bf | xtensa  | none   | BR2_PACKAGE_SCHIFRA_EXAMPLES | y     |
|      0 | 2014-10-25 15:21:19 | Peter Korsgaard (gcc20)   | baed9088133226852e16c20371e27fde13a4e50a | sh4a    | none   | BR2_PACKAGE_SCHIFRA_EXAMPLES | y     |
|      0 | 2014-10-25 13:17:06 | Richard Braun (sceen.net) | eb76c124dbcc00d1ecf257a22f9dd0b5588938ce | powerpc | none   | BR2_PACKAGE_SCHIFRA_EXAMPLES | y     |
|      0 | 2014-10-25 12:12:11 | Nathaniel Roach           | 1259286947005408b8074df754babefaf82c061c | arm     | none   | BR2_PACKAGE_SCHIFRA_EXAMPLES | y     |
+--------+---------------------+---------------------------+------------------------------------------+---------+--------+------------------------------+-------+

And you can indeed look for example at
http://autobuild.buildroot.org/results/eb7/eb76c124dbcc00d1ecf257a22f9dd0b5588938ce/,
it really looks like a successful build, which had the schifra examples
option enabled.

We even see Schifra being built in the build-time.log:

1414235482:start:extract             : schifra
1414235482:end  :extract             : schifra
1414235482:start:patch               : schifra
1414235482:end  :patch               : schifra
1414235482:start:configure           : schifra
1414235482:end  :configure           : schifra
1414235482:start:build               : schifra
1414235511:end  :build               : schifra
1414235511:start:install-staging     : schifra
1414235511:end  :install-staging     : schifra
1414235511:start:install-target      : schifra
1414235511:end  :install-target      : schifra

Weird.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
